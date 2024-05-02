#!/usr/bin/env python3

from typing import (
    Callable, Dict, Iterable, Iterator, List, Sequence, TypeVar,
)
from pathlib import Path
import re
import shlex

SRC_DIR = Path(__file__).parent.resolve(strict=True)
DOT_DIR = SRC_DIR.parent
DATA = DOT_DIR / 'template.json'


class Node:
    def format(self, data: Dict[str, object]) -> Iterator[str]:
        raise NotImplementedError()


class Block:
    def __init__(self, segs: List[str], node: Node) -> None:
        self.segs = segs
        self.node = node


Blocks = List[Block]
StmtCtor = Callable[[Blocks], Node]
STATEMENTS: Dict[str, StmtCtor] = {}
T = TypeVar('T', bound=StmtCtor)


def statement(name: str) -> Callable[[T], T]:
    def dec(cls: T) -> T:
        STATEMENTS[name] = cls
        return cls
    return dec


class Join(Node):
    def __init__(self, left: Node, right: Node) -> None:
        self.left = left
        self.right = right

    def format(self, data: Dict[str, object]) -> Iterator[str]:
        yield from self.left.format(data)
        yield from self.right.format(data)


class Text(Node):
    def __init__(self, text: str) -> None:
        self.text = text

    def format(self, data: Dict[str, object]) -> Iterator[str]:
        yield self.text


class Expr(Node):
    def __init__(self, key: str, fmt: str | None = None) -> None:
        self.key = key
        self.fmt = fmt

    def format(self, data: Dict[str, object]) -> Iterator[str]:
        val = data[self.key]
        if not isinstance(val, str):
            raise TypeError(f'expected string for key {self.key},'
                            f' got {type(val)}')
        if self.fmt == "rgb":
            if len(val) != 6:
                raise ValueError(f'expected rrggbb for key {self.key},'
                                 f' got {val!r}')
            val = ','.join(str(int(val[i:i + 2], 16)) for i in range(0, 6, 2))
        yield val


@statement('for')
class For(Node):
    def __init__(self, blocks: Blocks) -> None:
        [block] = blocks
        _, self.key, *self.vrs = block.segs
        self.body = block.node

    def format(self, data: Dict[str, object]) -> Iterator[str]:
        container = data[self.key]
        items: Iterable[Sequence[object]]
        if isinstance(container, list):
            items = ((v,) for v in container)
        elif isinstance(container, dict):
            items = container.items()
        else:
            raise TypeError(f'expected list or dict for key {self.key},'
                            f' got {type(container)}')
        for item in items:
            if len(self.vrs) != len(item):
                raise TypeError(f'length mismatch for vars {self.vrs}')
            sub_data = dict(data, **dict(zip(self.vrs, item)))
            yield from self.body.format(sub_data)


@statement('format')
class Format(Node):
    def __init__(self, blocks: Blocks) -> None:
        [block] = blocks
        _, self.key = block.segs
        self.arg = block.node

    def format(self, data: Dict[str, object]) -> Iterator[str]:
        fmt = data[self.key]
        if not isinstance(fmt, str):
            raise TypeError(f'expected string for key {self.key},'
                            f' got {type(fmt)}')
        arg = ''.join(self.arg.format(data))
        yield fmt.format(arg)


class Parser:
    TEMPL_RE = re.compile(r'\{\{(.*?)\}\}|^[ \t]*%%(.*)\n', re.MULTILINE)

    def __init__(self, templ: str) -> None:
        self._rest = templ
        self._next()

    def _next(self):
        segs = [s for s in self.TEMPL_RE.split(self._rest, maxsplit=1)
                if s is not None]
        if len(segs) == 1:
            self.text = segs[0]
            self._rest = ''
            self.segs = None
            self.opening = self.closing = False
        else:
            self.text, line, self._rest = segs
            self.segs = shlex.split(line)
            if len(self.segs) == 0:
                raise SyntaxError('empty expr')
            self.opening = self.segs[-1] == '['
            self.closing = self.segs[0] == ']'
            if self.opening:
                self.segs.pop()
            if self.closing:
                self.segs.pop(0)

    def parse(self) -> Node:
        text = Text(self.text)
        if self.segs is None or self.closing:
            return text
        if self.opening:
            blocks = []
            while True:
                stmt = self.segs
                self._next()
                body = self.parse()
                blocks.append(Block(stmt, body))
                if not self.closing:
                    raise SyntaxError('missing closing bracket at '
                                      f'{self.segs}')
                if not self.opening:
                    break
            name = blocks[0].segs[0]
            cls = STATEMENTS[name]
            node = cls(blocks)
        else:
            node = Expr(*self.segs)
        self._next()
        succ = self.parse()
        return Join(text, Join(node, succ))


class Template:
    def __init__(self, path: Path) -> None:
        templ = path.read_text('utf-8')
        parser = Parser(templ)
        self.root = parser.parse()

    def format(self, data: Dict[str, object]) -> str:
        return ''.join(self.root.format(data))

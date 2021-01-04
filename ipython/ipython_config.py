from typing import Any, TYPE_CHECKING
if TYPE_CHECKING:
    c: Any = None

# c.TerminalInteractiveShell.colors = 'linux'
c.TerminalInteractiveShell.confirm_exit = False
c.TerminalInteractiveShell.editing_mode = 'vi'
c.TerminalInteractiveShell.prompt_includes_vi_mode = False

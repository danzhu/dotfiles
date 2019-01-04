def clang_complete(pkg):
    pkg.symlink('~/.clang_complete', 'clang_complete')


def clang_format(pkg):
    pkg.symlink('~/.clang-format', 'clang-format')


def clang_tidy(pkg):
    pkg.symlink('~/.clang-tidy', 'clang-tidy')

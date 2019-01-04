def flake8(pkg):
    pkg.symlink('~/.config/flake8', 'flake8')


def pylint(pkg):
    pkg.symlink('~/.pylintrc', 'pylintrc')

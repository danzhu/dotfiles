def zplug(pkg):
    pkg.clone('zplug', 'https://github.com/zplug/zplug')


def zsh(pkg):
    pkg.depend('zplug')
    pkg.symlink('~/.zprofile', 'zprofile')
    pkg.symlink('~/.zshenv', 'zshenv')
    pkg.symlink('~/.zshrc', 'zshrc')

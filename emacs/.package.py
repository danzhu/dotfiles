def emacs(pkg):
    pkg.symlink('~/.emacs.d/init.el', 'init.el')
    pkg.symlink('~/.emacs.d/config', 'config')
    pkg.symlink('~/.emacs.d/themes', 'themes')

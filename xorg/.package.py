def x(pkg):
    pkg.symlink('~/.Xresources', 'Xresources')
    pkg.symlink('~/.xinitrc', 'xinitrc')
    pkg.symlink('~/.xprofile', 'xprofile')

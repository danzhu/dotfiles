def x(pkg):
    pkg.symlink('~/.Xdefaults', 'Xresources')
    pkg.symlink('~/.Xresources', 'Xresources')
    pkg.symlink('~/.xinitrc', 'xinitrc')
    pkg.symlink('~/.xprofile', 'xprofile')

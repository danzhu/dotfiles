def x(pkg):
    pkg.symlink('~/.Xdefaults', 'Xresources')
    pkg.symlink('~/.Xresources', 'Xresources')
    pkg.symlink('~/.xinitrc', 'xinitrc')
    pkg.symlink('~/.xprofile', 'xprofile')
    for conf in ['00-keyboard.conf', '30-mouse.conf', '30-touchpad.conf']:
        pkg.copy(f'/etc/X11/xorg.conf.d/{conf}', conf)

def pacman(pkg):
    hooks = [
        'orphan.hook',
        'paccache.hook',
        'systemd-boot.hook',
    ]
    for hook in hooks:
        pkg.copy('/etc/pacman.d/hooks/' + hook, hook)

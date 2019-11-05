def systemd(pkg):
    for f in ['noclear.conf', 'override.conf']:
        pkg.copy(f'/etc/systemd/system/getty@tty1.service.d/{f}',
                 f'{f}')

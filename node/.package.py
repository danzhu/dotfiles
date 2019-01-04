def npm(pkg):
    pkg.symlink('~/.npmrc', 'npmrc')


def tern(pkg):
    pkg.symlink('~/.tern-config', 'tern-config')

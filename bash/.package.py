def bash(pkg):
    pkg.depend('readline')
    pkg.symlink(dest='~/.bash_profile', target='bash_profile')
    pkg.symlink('~/.bashrc', 'bashrc')

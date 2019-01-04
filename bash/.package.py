def bash(pkg):
    pkg.symlink(dest='~/.bash_profile', target='bash_profile')
    pkg.symlink('~/.bashrc', 'bashrc')

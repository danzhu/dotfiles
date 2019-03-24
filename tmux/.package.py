def tpm(pkg):
    pkg.clone('plugins/tpm', 'https://github.com/tmux-plugins/tpm')


def tmux(pkg):
    pkg.depend('tpm')
    pkg.symlink('~/.tmux.conf', 'tmux.conf')

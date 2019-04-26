def kak(pkg):
    pkg.symlink('~/.config/kak', '.')
    pkg.clone('plugins/plug.kak', 'https://github.com/andreyorst/plug.kak')

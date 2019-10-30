_PLUG = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
_FILES = [
    'after',
    'autoload/airline',
    'colors',
    'colorscheme',
    'ftdetect',
    'ftplugin',
    'plugins.vim',
    'spell',
    'syntax',
    'ycm_extra_conf.py',
]


def nvim(pkg):
    pkg.download('~/.config/nvim/autoload/plug.vim', _PLUG)
    for f in _FILES:
        pkg.symlink(f'~/.config/nvim/{f}', f)
    pkg.symlink('~/.config/nvim/init.vim', 'init.vim')


def vim(pkg):
    pkg.download('~/.vim/autoload/plug.vim', _PLUG)
    for f in _FILES:
        pkg.symlink(f'~/.vim/{f}', f)
    pkg.symlink('~/.vim/vimrc', 'init.vim')

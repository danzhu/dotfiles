def vim_plug(pkg):
    url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    pkg.download('autoload/plug.vim', url)


def nvim(pkg):
    pkg.depend('vim_plug')
    pkg.symlink('~/.config/nvim', '.')


def vim(pkg):
    pkg.depend('vim_plug')
    pkg.symlink('~/.vim', '.')
    pkg.symlink('vimrc', 'init.vim')

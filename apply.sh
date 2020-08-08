# Initial Variables
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# NeoVim
mkdir -p ~/.config/nvim
cp $DIR/nvim/init.vim ~/.config/nvim/init.vim
cp $DIR/nvim/coc.vim ~/.config/nvim/coc.vim


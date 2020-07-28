# Initial Variables
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# NeoVim
mkdir -p $DIR/nvim
cp ~/.config/nvim/init.vim $DIR/nvim/init.vim
cp ~/.config/nvim/coc.vim $DIR/nvim/coc.vim


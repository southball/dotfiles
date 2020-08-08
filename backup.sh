# Initial Variables
DIR=$(dirname "$(readlink -f "$0")")

# NeoVim
mkdir -p $DIR/nvim
cp ~/.config/nvim/init.vim $DIR/nvim/init.vim
cp ~/.config/nvim/coc.vim $DIR/nvim/coc.vim

# ZSH
mkdir -p $DIR/zsh
cp ~/.zshrc $DIR/zsh/.zshrc

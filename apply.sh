# Initial Variables
DIR=$(dirname "$(readlink -f "$0")")

# NeoVim
mkdir -p ~/.config/nvim
cp $DIR/nvim/init.vim ~/.config/nvim/init.vim
cp $DIR/nvim/coc.vim ~/.config/nvim/coc.vim

# ZSH
cp $DIR/zsh/.zshrc ~/.zshrc

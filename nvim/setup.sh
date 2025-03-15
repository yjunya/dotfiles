# change directory to the shell file's directory
SCRIPT_DIR=$(dirname $0)
cd $SCRIPT_DIR

mkdir -p ~/.config/nvim
# ln -siv $(pwd)/init.vim ~/.config/nvim/init.vim
ln -siv $(pwd)/init.lua ~/.config/nvim/init.lua


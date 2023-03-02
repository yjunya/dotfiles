# change directory to the shell file's directory
SCRIPT_DIR=$(dirname $0)
cd $SCRIPT_DIR

ln -siv $(pwd)/gitconfig ~/.gitconfig
mkdir -p ~/.config/git
ln -siv $(pwd)/subfiles/* ~/.config/git

# change directory to the shell file's directory
SCRIPT_DIR=$(dirname $0)
cd $SCRIPT_DIR

mkdir -p ~/.config/ghostty
ln -siv $(pwd)/config ~/.config/ghostty/config

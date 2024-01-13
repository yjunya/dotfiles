# change directory to the shell file's directory
SCRIPT_DIR=$(dirname $0)
cd $SCRIPT_DIR

TARGET_DIR=~/.hammerspoon

mkdir -p $TARGET_DIR
ln -siv $(pwd)/init.lua $TARGET_DIR/init.lua


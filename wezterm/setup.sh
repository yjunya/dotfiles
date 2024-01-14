# change directory to the shell file's directory
SCRIPT_DIR=$(dirname $0)
cd $SCRIPT_DIR

TARGET_DIR=~/.config/wezterm

mkdir -p $TARGET_DIR
ln -siv $(pwd)/wezterm.lua $TARGET_DIR/wezterm.lua


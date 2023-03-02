# change directory to the shell file's directory
SCRIPT_DIR=$(dirname $0)
cd $SCRIPT_DIR

mkdir -p ~/.config
ln -siv $(pwd)/starship.toml ~/.config/starship.toml

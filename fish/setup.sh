# change directory to the shell file's directory
SCRIPT_DIR=$(dirname $0)
cd $SCRIPT_DIR

if [[ $(which fish) != '/opt/homebrew/bin/fish' ]]; then
  brew install fish
  sudo sh -c "echo '$HOMEBREW_PREFIX/bin/fish' >> /etc/shells"
  chsh -s $HOMEBREW_PREFIX/bin/fish
fi

mkdir -p ~/.config/fish
ln -siv $(pwd)/config.fish ~/.config/fish
mkdir -p ~/.config/fish/conf.d
ln -siv $(pwd)/conf.d/* ~/.config/fish/conf.d


# change directory to the shell file's directory
SCRIPT_DIR=$(dirname $0)
cd $SCRIPT_DIR

if [ $(which zsh) != "/opt/homebrew/bin/zsh" ]; then
  sudo sh -c "echo '$HOMEBREW_PREFIX/bin/zsh' >> /etc/shells"
  chsh -s $HOMEBREW_PREFIX/bin/zsh
fi

ln -siv $(pwd)/main.zsh ~/.zshrc
mkdir -p ~/.config/zsh
ln -siv $(pwd)/subfiles/* ~/.config/zsh
mkdir -p ~/.config/sheldon
ln -siv $(pwd)/sheldon/plugins.toml ~/.config/sheldon/plugins.toml

# change directory to the shell file's directory
SCRIPT_DIR=$(dirname $0)
cd $SCRIPT_DIR

# Macのみ実行可能
if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "Not running on Mac OS X. Aborting!"
  exit 1
fi

# gitconfig.userファイルの存在チェック
if [ ! -e "./git/subfiles/gitconfig.user" ]; then
  echo "gitconfig file not exists."
  exit 1
fi

###############################################################################
# Homebrew                                                                    #
###############################################################################

# Homebrewが存在しないならインストール
if [ -z "$(which brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" </dev/null
  eval $(/opt/homebrew/bin/brew shellenv)
fi

brew update && brew upgrade

brew bundle

brew cleanup && brew --cask cleanup

###############################################################################
# git                                                                         #
###############################################################################

sh ./git/setup.sh

###############################################################################
# nvim                                                                        #
###############################################################################

sh ./nvim/setup.sh

###############################################################################
# starship                                                                    #
###############################################################################

sh ./starship/setup.sh

###############################################################################
# zsh                                                                         #
###############################################################################

sh ./zsh/setup.sh


###############################################################################
# defaults                                                                    #
###############################################################################

sh ./defaults/setup.sh

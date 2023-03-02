# change directory to the shell file's directory
SCRIPT_DIR=$(dirname $0)
cd $SCRIPT_DIR

###############################################################################
# general                                                                     #
###############################################################################

# 起動時の音をミュート
sudo nvram StartupMute=%01

# dockのアイコンのサイズを36pxに
defaults write com.apple.dock tilesize -int 36

# dockのアイコンが跳ねるのを禁止
defaults write com.apple.dock no-bouncing -boolean true

#  「保存」，「印刷」時の表示の初期設定を詳細設定にする
defaults write -g NSNavPanelExpandedStateForSaveMode -boolean true
defaults write -g PMPrintingExpandedStateForPrint -boolean true

# スクリーンショットの保存先を変更
mkdir -p ~/ScreenCapture
defaults write com.apple.screencapture location ~/ScreenCapture

# ダークモードに
defaults write "Apple Global Domain" AppleInterfaceStyle -string "Dark"

# スマートクオートとスマートダッシュを無効に
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# auto-correctを無効に
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# 自動大文字の無効化
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# バッテリーのパーセント表示
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Googe Public DNSを設定
networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4

# USBやネットワークストレージに.DS_Storeファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Bluetoothを上部に表示
defaults -currentHost write com.apple.controlcenter Bluetooth -int 18
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool 1


###############################################################################
# Finder                                                                      #
###############################################################################

# cmd+Qで終了するように
defaults write com.apple.finder QuitMenuItem -bool true

# 拡張子を表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true

# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true

# 名前で並べ替えを選択時にディレクトリを前に置くようにする
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# 検索時にデフォルトでカレントディレクトリを検索
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# 拡張子変更時の警告を無効化
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# デフォルトをカラム表示に
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clsv"

# ディレクトリのスプリングロードを有効化
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# スプリングロード遅延を除去
defaults write NSGlobalDomain com.apple.springing.delay -float 0


###############################################################################
# Dock                                                                        #
###############################################################################

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# デフォルトのappを削除
defaults write com.apple.dock persistent-apps -array

# 最新の使用状況に基づいてSpacesを自動的に並べ替えないように
defaults write com.apple.dock mru-spaces -bool false

# 自動的にDockを表示/非表示
defaults write com.apple.dock autohide -bool true

###############################################################################
# Spotlight                                                                   #
###############################################################################

# Disable Spotlight hotkey
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:64 dict" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:64:enabled bool" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:64:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist

###############################################################################
# TextEdit                                                                    #
###############################################################################

# 新規TextEditにプレーンテキストモードを使用
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
# TextEditでファイルをUTF-8で開く/保存
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

###############################################################################
# vscode                                                                      #
###############################################################################

# VSCodeでvimの移動キー長押しが反応するように変更
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false


###############################################################################

printf "\n Rebooting is recommended.\n"

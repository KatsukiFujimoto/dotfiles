#!/bin/zsh

set -u

relative_dir_path=$(dirname $0)
absolute_path_for() {
  relative_path="$relative_dir_path/$1"
  absolute_path="$(pwd)${relative_path:1}"
  echo $absolute_path
}
source $(absolute_path_for "dock.sh")

# Refs
## https://macos-defaults.com/

# Memo
## .GlobalPreferences NSGlobalDomainは同じdomainを指しているっぽい

# Keyboard
## キーのリピート速度
defaults write -g KeyRepeat -int 1
## キーのリピート認識時間
defaults write -g InitialKeyRepeat -int 11

# Trackpad
## 軌跡の速さ
defaults write .GlobalPreferences com.apple.trackpad.scaling -int 3
## ２本指でクリックまたはタップでクリックとして認識させる
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1

# Mouse
## 軌跡の速さ
defaults write .GlobalPreferences com.apple.mouse.scaling -int 3

# Dock
## Dockを自動的に表示/非表示
defaults write com.apple.dock autohide -bool true
## Iconサイズ
defaults write com.apple.dock tilesize -int 50
## カーソルフォーカス時にIconを拡大させるか
defaults write com.apple.dock magnification -bool false
## ウィンドウをしまうときのエフェクト
defaults write com.apple.dock mineffect -string "scale"
## Dockに表示するアプリやフォルダなどの指定
### デフォルトのアプリを消す
defaults write com.apple.dock persistent-apps -array
### デフォルトのアプリ以外のものを消す
defaults write com.apple.dock persistent-others -array
# Dockに表示するアプリやフォルダを追加
for app (
  '/System/Applications/System Preferences.app'
  '/System/Applications/Launchpad.app'
  '/System/Applications/App Store.app'
  '/Applications/Google Chrome.app'
); do
  add_app_to_dock $app
done
unset app

for folder (
  $HOME/Downloads
); do
  add_folder_to_dock $folder -a 2
done
unset folder

# MenuBar
## MenuBarを自動的に表示/非表示
defaults write .GlobalPreferences _HIHideMenuBar -bool false
## 時間フォーマット
defaults write com.apple.menuextra.clock DateFormat -string "\"EEE d MMM HH:mm:ss\""

# Finder
## 全ファイルの拡張子を表示する
defaults write .GlobalPreferences AppleShowAllExtensions -bool true
## 隠しファイルの表示
defaults write com.apple.finder AppleShowAllFiles -bool true
## パスバーの表示
defaults write com.apple.finder ShowPathbar -bool true
## ステータスバーの表示
defaults write com.apple.finder ShowStatusBar -bool true
## デフォルトで表示するフォルダーの指定
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/"
## networkやUSBボリューム上に.DS_Storeを作成しないようにする
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
## デフォルトのアイコン表示方法の指定(`Icnv`, `Clmv`, `Glyv`)
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Battery
## バッテリーを%表示
defaults write com.apple.menuextra.battery ShowPercent -bool true

# Screen
## Save screenshots to the Pictures/Screenshots
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

# Feedback
## フィードバックを送信しない
defaults write com.apple.appleseed.FeedbackAssistant Autogather -bool false
## クラッシュレポート無効化
defaults write com.apple.CrashReporter DialogType -string "none"

# Security
## ファイアウォールon
sudo defaults write /Library/Preferences/com.Apple.alf globalstate -int 1
## スリープまたはスクリーンセーバから復帰した際、パスワードをすぐに要求する
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Accessibility
## 視差効果を減らす
defaults write com.apple.Accessibility ReduceMotionEnabled -int 1
defaults write com.apple.Accessibility EnhancedBackgroundContrastEnabled -int 1
defaults write com.apple.universalaccess reduceMotion -int 1
## 透明度を下げる
defaults write com.apple.universalaccess reduceTransparency -int 1

# Others
## 自動で頭文字を大文字にしない
defaults write .GlobalPreferences NSAutomaticCapitalizationEnabled -bool "false"
## ライブ変換をなしにする
defaults write com.apple.inputmethod.Kotoeri JIMPrefLiveConversionKey -int 0
## スペルの訂正を無効にする
defaults write .GlobalPreferences NSAutomaticSpellingCorrectionEnabled -bool "false"
## ダッシュの自動置換を無効にする
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
## ピリオドの自動置換を無効にする
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
## クォーテーションの自動置換を無効にする
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
## デフォルトでiCloudではなくディスクに保存する
defaults write .GlobalPreferences NSDocumentSaveNewDocumentsToCloud -int 0
## スワイプの方向
defaults write .GlobalPreferences com.apple.swipescrolldirection -int 0
## カーソルサイズを調節
defaults write com.apple.universalaccess mouseDriverCursorSize -int 2
## 立ち上げ時の起動音の制御
### sudo nvram StartupMute=%01

# mac theme
defaults write .GlobalPreferences AppleInterfaceStyle -string "Dark"

# Chrome
## ショートカット
defaults write com.google.Chrome NSUserKeyEquivalents '{
  "ホーム" = "@h";
  "新しいタブ" = "^t";
  "閉じたタブを開く" = "^$t";
  "タブを閉じる" = "^w";
  "次のタブを選択" = "^l";
  "前のタブを選択" = "^h";
  "タブを新しいウィンドウに移動" = "@$n";
  "ページを再読み込み" = "^r";
  "場所を開く..." = "@l";
  "進む" = "@$l";
  "戻る" = "@$h";
  "新規ウインドウ" = "^n";
  "新規シークレット ウインドウ" = "^$n";
}'

# iterm2
## https://iterm2.com/documentation-hidden-settings.html

# 設定反映
killall Dock
killall Finder
killall SystemUIServer
killall cfprefsd

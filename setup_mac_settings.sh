#!/bin/zsh

set -u

# Refs
## https://macos-defaults.com/

# Keyboard
## キーのリピート速度
defaults write -g KeyRepeat -int 1
## キーのリピート認識時間
defaults write -g InitialKeyRepeat -int 11

# Trackpad
## 軌跡の速さ
defaults write .GlobalPreferences com.apple.trackpad.scaling -int 3

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

# MenuBar
## MenuBarを自動的に表示/非表示
defaults write .GlobalPreferences _HIHideMenuBar -bool false
## 時間フォーマット
defaults write com.apple.menuextra.clock DateFormat -string "\"EEE d MMM HH:mm:ss\""

# Finder
## 拡張子まで表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
## 全ファイルの拡張子を表示する
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
## 隠しファイルの表示
defaults write com.apple.finder AppleShowAllFiles -bool true
## パスバーの表示
defaults write com.apple.finder ShowPathbar -bool true
## デフォルトのデータ保存先（ディスク or icloud）
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool true

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

# Others
## 自動で頭文字を大文字にしない
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool "false"
## スペルの訂正を無効にする
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool "false"
## スリープまたはスクリーンセーバから復帰した際、パスワードをすぐに要求する
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
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

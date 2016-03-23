#!/bin/sh

#
# Global
#

# 起動音を小さく
sudo nvram SystemAudioVolume=%00

# フルキーボードアクセスを有効
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Fuキーを標準のファンクションキーとして使用
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

# キーのリピート（preferences panalでは、２が最小）
defaults write NSGlobalDomain KeyRepeat -int 0

# リピート入力認識までの時間（preference panelでは１５が最小値）
defaults write NSGlobalDomain InitialKeyRepeat -int 1

# サイドバーのアイコンサイズを大きく
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 3

# 拡張子を常に表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# 保存ダイアログを詳細設定で表示
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -boolean true

# 印刷ダイアログを詳細設定で表示 (10.6 and before, Key name is PMPrintingExpandedStateForPrint)
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -boolean true

# ファイルの保存場所のデフォルトをiCloud以外にする
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# 外部ディスプレイでアンチエイリアスを有効にする（サブピクセルレンダリングを「中」レベルで設定）
defaults -currentHost write -globalDomain AppleFontSmoothing -int 2


#
# Menubar
#


# バッテリー残量を％表記に
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# 日付と時刻のフォーマット（24時間表示、秒表示あり、日付・曜日を表示）
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm:ss"


#
# Dock
#

# 通常サイズ
defaults write com.apple.dock tilesize -int 32

# 拡大を有効にする
defaults write com.apple.dock magnification -bool yes

# 拡大時のサイズ (一般的な最大: 128)
defaults write com.apple.dock largesize -int 128

# Dockを自動的に隠さない
defaults write com.apple.dock autohide -bool false

# Dockをすぐに表示する
defaults write com.apple.dock autohide-delay -float 0

# Dockの位置を右端、または下端によせる
defaults write com.apple.dock pinning -string end

# 設定反映
killall Dock


#
# Dashboard
#

# Dashboardを無効にする
defaults write com.apple.dashboard mcx-disabled -bool true

#
# Finder
#

# デフォルトはカラムビュー表示
defaults write com.apple.finder FXPreferredViewStyle clmv

# 隠しファイルや隠しフォルダを表示
defaults write com.apple.finder AppleShowAllFiles -bool true

# デスクトップ上にアイコンを表示しない
defaults write com.apple.finder CreateDesktop -boolean false

# タイトルバーにフルパスを表示
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true

# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true

# 他のウィンドウに移った時にQuick Lookを非表示する
defaults write com.apple.finder QLHidePanelOnDeactivate -bool true

# Quick Look上でテキストの選択を可能に
defaults write com.apple.finder QLEnableTextSelection -bool true

# フォルダを開くときのアニメーションを無効
defaults write com.apple.finder AnimateWindowZoom -bool false

# ファイルを開くときのアニメーションを無効
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# Finderのアニメーション効果を全て無効にする
defaults write com.apple.finder DisableAllAnimations -bool true

# スクロールバーの弾むアニメーションを無効にする
defaults write -g NSScrollViewRubberbanding -bool no

# ダイアログ表示やウィンドウリサイズ速度を高速化
defaults write -g NSWindowResizeTime 0.1

# Finderの効果音を無効にする
defaults write com.apple.finder FinderSounds -bool no

# ファイルを開く際の警告ダイアログを無効にする
defaults write com.apple.LaunchServices LSQuarantine -bool false

# 「ライブラリ」を常に表示
chflags nohidden ~/Library

# クラッシュリポーターを無効にする
defaults write com.apple.CrashReporter DialogType none

# Finder再起動して設定を反映
killall Finder


#
# System
#

# ネットワークフォルダに.DS_Storeを作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true


#
# Trackpad
#

# タップでクリック
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# スクロール方向をナチュラルに
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true


#
# Screen Capture
#

# キャプチャの保存場所を変更
defaults write com.apple.screencapture location ~/Downloads

# キャプチャのプレフィックスを変更
defaults write com.apple.screencapture name "SS_"

# キャプチャに影を付けない
defaults write com.apple.screencapture disable-shadow -boolean true

# 設定を反映
killall SystemUIServer


#
# Preview
#

# 起動時に前回開いたウィンドウを開かない
defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool false


#
# QuickTime
#

# 起動時に前回開いたファイルを開かない
defaults write com.apple.QuickTimePlayerX NSQuitAlwaysKeepsWindows -bool false

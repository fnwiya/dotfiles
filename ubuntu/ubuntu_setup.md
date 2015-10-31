[ ] sudo apt-get update
[ ] 無線LAN用ドライバー
sudo apt-get install bcmwl-kernel-source
[ ] dropboxインストール
https://www.dropbox.com/ja/install?os=linux
[ ] バックアップ復元
http://pchdddata.blog85.fc2.com/blog-entry-974.html
[ ] GoogleChromeインストール
https://www.google.co.jp/chrome/browser/desktop/index.html
[ ] emacs
http://nkenbou.hatenablog.com/entry/2015/06/30/051408
[ ] まとめてインストール
sudo apt-get install -y git trash-cli gimp vlc shutter unity-tweak-tool nautilus-open-terminal build-essential vim-gtk zsh ubuntu-restricted-extras curl xbacklight
[ ] github clone
sudo git clone "https://github.com/fnwiya/dotfiles.git"
sh dotfilesLink.sh
sudo git clone "https://github.com/fnwiya/.emacs.d.git"
[ ] gtag
参考
http://qiita.com/sona-tar/items/672df1259a76f082ce42
install global --with-exuberant-ctags --with-pygments
pip install pygments
[ ] cmigemo
git clone https://github.com/koron/cmigemo
cd cmigemo
./configure
make gcc
make gcc-dict
make gcc-install
▼参考
http://qiita.com/kenbeese/items/ebbf0128d7c752a94a22
http://qiita.com/catatsuy/items/c5fa34ead92d496b8a51
[ ] ディレクトリの表記を英語にする
LANG=C xdg-user-dirs-gtk-update
[ ] zshをデフォルトに
which zsh
chsh -s /usr/bin/zsh
[ ] vimを標準エディタに
sudo update-alternatives --config editor
[ ] F1 - F12キーをFnキーなしで押せるようにする
sudo vim /etc/rc.local
【 echo 2 > /sys/module/hid_apple/parameters/fnmode 】を追加
[ ] skypeインストール
http://www.skype.com/ja/download-skype/skype-for-linux/
[ ] Nautilusのアドレスバーをテキスト形式にする&隠しファイルの表示
gsettings set org.gnome.nautilus.preferences always-use-location-entry true
[ ] Ubuntu Web Appsを削除する
sudo apt-get remove unity-webapps-common xul-ext-unity xul-ext-websites-integration
[ ] ログインの音無効化
sudo vim /usr/share/gnome/autostart/libcanberra-login-sound.desktop
->change the “NoDisplay” from “true” to “false”
[ ] 自動起動するプログラムにこのコマンドを追加。
trash-empty 1
[ ] 入力メソッドの設定
設定->mozcを優先->「かな」「英数」の設定
[ ] ワークスペースを有効にする
[ ] 言語サポートインストール
[ ] セキュリティとプライバシー設定
[ ] マウスとタッチパッド設定
[ ] キーボード設定
[ ] フォント設定
[ ] テーマ/icon設定
http://ubuntuapps.blog67.fc2.com/blog-entry-729.html
[ ] 壁紙設定
[ ] wine
sudo add-apt-repository ppa:ubuntu-wine/ppa
sudo apt-get update
sudo apt-get install wine1.7
[ ] evernote
http://www.download3k.com/Install-Evernote.html
[ ] line
http://line.me/ja/download
[ ] Dock整理
　[ ] 削除（Ofice,)
　[ ] 追加（Chrome,)

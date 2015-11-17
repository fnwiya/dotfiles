[ ] 無線LAN用ドライバー
sudo apt-get install bcmwl-kernel-source
[ ] GoogleChromeインストール
https://www.google.co.jp/chrome/browser/desktop/index.html
[ ] emacs
http://nkenbou.hatenablog.com/entry/2015/06/30/051408
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
[ ] vimを標準エディタに
sudo update-alternatives --config editor
[ ] F1 - F12キーをFnキーなしで押せるようにする
sudo vim /etc/rc.local
【 echo 2 > /sys/module/hid_apple/parameters/fnmode 】を追加
[ ] skypeインストール
http://www.skype.com/ja/download-skype/skype-for-linux/
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
[ ] Dock整理
　[ ] 削除（Ofice,)
　[ ] 追加（Chrome,)


- 無線LAN用ドライバー
    - ```sudo apt-get install bcmwl-kernel-source```
- [GoogleChromeインストール](https://www.google.co.jp/chrome/browser/desktop/index.html)
- [emacsインストール](http://nkenbou.hatenablog.com/entry/2015/06/30/051408)
- F1 - F12キーをFnキーなしで押せるようにする
    - ```sudo vim /etc/rc.local```
【 echo 2 > /sys/module/hid_apple/parameters/fnmode 】を追加
- [capsをctrlに](http://masaoo.blogspot.jp/2015/01/ubuntu-1404-lts-caps-lock-ctrl.html)
- [skypeインストール](http://www.skype.com/ja/download-skype/skype-for-linux/)
- [slackをインストール](https://slack.com/downloads)
- ログインの音無効化
    - ```sudo vim /usr/share/gnome/autostart/libcanberra-login-sound.desktop```
    - ->change the “NoDisplay” from “true” to “false”
- 自動起動するプログラムにこのコマンドを追加。
    - trash-empty 1
- 入力メソッドの設定
設定->mozcを優先->「かな」「英数」の設定
- ワークスペースを有効にする
- 言語サポートインストール
- セキュリティとプライバシー設定
- マウスとタッチパッド設定
- キーボード設定
- フォント設定
- [テーマ/icon設定](http://ubuntuapps.blog67.fc2.com/blog-entry-729.html)
- 壁紙設定
- Dock整理
    - 削除（Ofice,)
    - 追加（Chrome,)
- [http://qiita.com/takeoverjp/items/9493a9838deb905ac519]([Ubuntu] emacsユーザがまずすべき設定)

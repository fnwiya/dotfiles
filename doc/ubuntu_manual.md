
- 無線LAN用ドライバー
    - ```sudo apt-get install bcmwl-kernel-source```
- [https://www.google.co.jp/chrome/browser/desktop/index.html](GoogleChromeインストール)
- [http://nkenbou.hatenablog.com/entry/2015/06/30/051408](emacsインストール)
- F1 - F12キーをFnキーなしで押せるようにする
    - ```sudo vim /etc/rc.local```
【 echo 2 > /sys/module/hid_apple/parameters/fnmode 】を追加
- [http://www.skype.com/ja/download-skype/skype-for-linux/](skypeインストール)
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
- [http://ubuntuapps.blog67.fc2.com/blog-entry-729.html](テーマ/icon設定)
- 壁紙設定
- Dock整理
    - 削除（Ofice,)
    - 追加（Chrome,)

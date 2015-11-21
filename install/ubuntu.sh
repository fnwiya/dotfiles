# フォルダ名を英語に
LANG=C xdg-user-dirs-gtk-update
# Nautilusのアドレスバーをテキスト形式にする&隠しファイルの表示
gsettings set org.gnome.nautilus.preferences always-use-location-entry true
# vimを標準エディタに
sudo update-alternatives --config editor
# Ubuntu Web Appsを削除する
sudo apt-get remove unity-webapps-common xul-ext-unity xul-ext-websites-integration

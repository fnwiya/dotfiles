## set local
sudo yum -y reinstall glibc-common
sudo localedef -v -c -i ja_JP -f UTF-8 ja_JP.UTF-8
sudo rm -f /etc/localtime
sudo ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

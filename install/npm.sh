#!/bin/bash
# http://askubuntu.com/questions/426750/how-can-i-update-my-nodejs-to-the-latest-version
sudo npm install -g babel-cli
sudo npm install -g bower
sudo npm install -g browserify
sudo npm install -g chai
sudo npm install -g cross-env
sudo npm install -g eslint
sudo npm install -g express
sudo npm install -g express-generator
sudo npm install -g jasmine
sudo npm install -g karma
sudo npm install -g mdr
sudo npm install -g mocha
sudo npm install -g n
sudo npm install -g nodemon
sudo npm install -g tern
sudo npm install -g webpack

# http://qiita.com/seibe/items/36cef7df85fe2cefa3ea
sudo n stable
sudo ln -sf /usr/local/bin/node /usr/bin/node
sudo apt-get purge -y nodejs npm
sudo npm updage npm

sudo npm cache clean -f

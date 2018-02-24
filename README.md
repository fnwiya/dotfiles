[
##] initialize
```
curl -L raw.github.com/fnwiya/dotfiles/master/cloneDotfiles.sh | bash
./install.sh
./mkLink.sh
```

## structure
```
.
├── .git
├── .gitignore
├── .gitmodules
├──  README.md
├── doc
│   ├── osx_manual.md
│   └── ubuntu_manual.md
├── install
│   ├── apt-get.sh
│   ├── brew.sh
│   ├── npm.sh
│   ├── osx.sh
│   ├── peco4linux.sh
│   ├── pip.sh
│   ├── pyenv.sh
│   ├── sbcl.sh
│   └── ubuntu.sh
├── install.sh
├── cloneDotfiles.sh
├── setup
│   ├── .gitconfig
│   ├── .gitignore_global
│   ├── .hgignore_global
│   ├── .hgrc
│   ├── .sbclrc
│   ├── .tern-config
│   ├── .tmux.conf
│   ├── .peco
│   ├── .emacs.d
│   │   ├── init.el
│   │   ├── cache
│   │   ├── elisp
│   │   │   ├── package
│   │   │   └── work
│   │   ├── loader-init
│   │   ├── snippets
│   │   └── themes
│   ├── bash
│   │   ├── .bash_profile
│   │   └── .bashrc
│   ├── linux
│   │   └── .shutter
│   ├── osx
│   │   └── key4remap
│   ├── vim
│   │   ├── .vim
│   │   └── .vimrc
│   └── zsh
│        ├── .zsh.d
│        ├── .zshrc
│        └── .zshenv
└── mkLink.sh
```
 


##initialize
```
curl -L raw.github.com/fnwiya/dotfiles/master/setDotfiles.sh | bash
./install.sh
./setup.sh
```

##policy


##structure
```
.
├── .git
├── .gitignore
├── .gitmodules
├──  README.md
├── doc
│   ├── osx_manual.md
│   └── ubuntu_manual.md
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
├── setDotfiles.sh
├── setup
｜   ├── .emacs.d
｜   │   ├── init.el
｜   │   ├── cache
｜   │   ├── elisp
｜   │   │   ├── package
｜   │   │   └── work
｜   │   ├── loader-init
｜   │   ├── snippets
｜   │   └── themes
｜   ├── .peco
｜   ├── bash
｜   │   ├── .bash_profile
｜   │   └── .bashrc
｜   ├── linux
｜   │   └── .shutter
｜   ├── osx
｜   │   └── key4remap
｜   ├── vim
｜   │   ├── .vim
｜   │   └── .vimrc
｜   └── zsh
｜       ├── .zsh.d
｜       ├── .zshrc
｜       └── .zshenv
└── setup.sh
```

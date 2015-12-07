
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
└── setup
    ├── .emacs.d
    │   ├── cache
    │   ├── elisp
    │   │   ├── package
    │   │   └── work
    │   ├── loader-init
    │   ├── snippets
    │   └── themes
    ├── .peco
    ├── bash
    ├── linux
    │   └── .shutter
    │       └── profiles
    ├── osx
    │   └── key4remap
    ├── vim
    │   └── .vim
    │       ├── bundle
    │       └── colors
    └── zsh
        └── .zsh.d
```

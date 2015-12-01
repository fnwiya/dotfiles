# meigen-bot
Echo meigen randomly in Emacs mini-buffer

## Install
put this package in your load-path-dir

## Usage
### Setting
```lisp
(add-to-list 'load-path path-to-meigen-bot)
(require 'meigen-bot)
(setq meigen-file-path path-to-your-meigen-file)
(setq meigen-separator "\n") ;; default is "\n"
(add-hook 'emacs-startup-hook
        (lambda ()
          (echo-meigen-to-minibuffer)
          ))
```

## License
MIT License

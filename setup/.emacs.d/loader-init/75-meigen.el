(add-to-list 'load-path "~/.emacs.d/elisp/myElisp/meigen-bot")
(use-package meigen-bot
  :config
  (setq meigen-file-path "~/.emacs.d/elisp/myElisp/meigen-bot/meigen.txt")
  (add-hook 'emacs-startup-hook
          (lambda ()
            (echo-meigen-to-minibuffer)
            ))
)

(add-to-list 'load-path "~/.emacs.d/elisp/work/meigen-bot")
(use-package meigen-bot
  :config
  (setq meigen-file-path "~/.emacs.d/elisp/work/meigen-bot/meigen.txt")
  (add-hook 'after-init-hook
          (lambda ()
            (echo-meigen-to-minibuffer))))

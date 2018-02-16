(use-package shell-pop
  :config
  (custom-set-variables
    ;; custom-set-variables was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
    ;; Your init file should contain only one such instance.
    ;; If there is more than one, they won't work right.
   '(shell-pop-shell-type (quote ("ansi-term" " *shell-pop-ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
   '(shell-pop-term-shell "/bin/zsh")
   '(shell-pop-universal-key "C-c C-p")
   '(shell-pop-window-height 30)
   '(shell-pop-window-position "bottom")))

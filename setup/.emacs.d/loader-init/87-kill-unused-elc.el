;; (add-hook 'kill-emacs-hook
;;           (lambda()
;;             (shell-command "rm -f ~/.emacs.d/loader-init/_*.elc")))
(add-hook 'kill-emacs-hook
          (lambda()
            (shell-command "rm -f ~/.emacs.d/init.elc")
            (shell-command "rm -f ~/.emacs.d/loader-init/*.elc")))

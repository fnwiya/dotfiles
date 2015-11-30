(add-hook 'kill-emacs-hook
          (lambda()
            (shell-command "rm -f ~/.emacs.d/loader-init/_*.elc")))

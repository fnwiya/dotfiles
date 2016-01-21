(when (equal system-name-simple "forcia-VirtualBox")
   (add-hook 'kill-emacs-hook
             (lambda()
               (shell-command "rm -rf ~/.local/share/Trash/*"))))

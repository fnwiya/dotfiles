(when (equal system-name-simple "forcia-VirtualBox")
   (add-hook 'kill-emacs-hook
             (lambda()
               (shell-command "rm -rf ~/.local/share/Trash/*"))))
(cond
 ((or (eq window-system 'ns) (eq window-system 'mac))
   (add-hook 'kill-emacs-hook
             (lambda()
               (shell-command "rm -rf ~/.Trash/*")))))

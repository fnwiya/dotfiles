(use-package evil-leader
  :config
  (setq evil-leader/in-all-states 1)
  (global-evil-leader-mode)
  (evil-leader/set-leader "SPC")
  (evil-leader/set-key
    ":" 'shell-command
    "=" 'indent-region
    "@" 'mark-whole-buffer
    "a" 'helm-projectile-ag
    "A" 'helm-ag
    "b" 'helm-buffers-list
    "e" 'helm-find-files
    "r" 'helm-recentf
    "s" 'helm-swoop
    ;; "x" 'helm-M-x
    "y" 'helm-show-kill-ring
    ;; "a" 'counsel-projectile-ag
    ;; "A" 'counsel-ag
    ;; "b" 'ivy-switch-buffer
    ;; "e" 'counsel-find-file
    ;; "r" 'ivy-recentf
    "x" 'counsel-M-x
    ;; "y" 'counsel-yank-pop
    "f" 'counsel-projectile-find-file
    "d" 'counsel-projectile-find-dir
    "g" 'avy-goto-word-0
    "k" 'kill-this-buffer
    "q" 'kill-this-buffer
    "t" 'other-window
    "w" 'save-buffer
    "v" 'evil-visual-block
    "h" 'seq-home
    "l" 'seq-end
    "n" 'goto-line
    ";" 'comment-dwim
    ))

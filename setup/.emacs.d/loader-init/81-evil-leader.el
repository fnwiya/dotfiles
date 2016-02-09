(use-package evil-leader
  :config
  ;; evil leader
  (setq evil-leader/in-all-states 1)
  (global-evil-leader-mode)
  (evil-leader/set-leader "SPC")
  (evil-leader/set-key
    ":" 'shell-command
    "a" 'avy-goto-word-0
    "b" 'helm-buffers-list
    "e" 'helm-find-files
    "f" 'projectile-find-file
    "g" 'magit-status
    "k" 'kill-this-buffer
    "q" 'kill-buffer-and-window
    "r" 'helm-recentf
    "s" 'isearch
    "t" 'other-window
    "w" 'save-buffer
    "x" 'helm-M-x
    "h" 'seq-home
    "l" 'seq-end
    ))

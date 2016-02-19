(use-package evil-leader
  :config
  ;; evil leader
  (setq evil-leader/in-all-states 1)
  (global-evil-leader-mode)
  (evil-leader/set-leader "SPC")
  (evil-leader/set-key
    ":" 'shell-command
    "=" 'indent-region
    "a" 'mark-whole-buffer
    "b" 'helm-buffers-list
    "e" 'helm-find-files
    "f" 'projectile-find-file
    "g" 'avy-goto-word-0
    "k" 'kill-this-buffer
    "q" 'kill-this-buffer
    "r" 'helm-recentf
    "s" 'isearch-forward
    "t" 'other-window
    "w" 'save-buffer
    "x" 'helm-M-x
    "h" 'seq-home
    "l" 'seq-end
    ))

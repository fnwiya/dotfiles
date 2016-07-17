(use-package evil-leader
  :config
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
    "v" 'evil-visual-block
    "x" 'helm-M-x
    "h" 'seq-home
    "l" 'seq-end
    "n" 'goto-line
    ";" 'comment-dwim
    ))

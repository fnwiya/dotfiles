(define-key global-map [?¥] [?\\])

(keyboard-translate ?\C-h ?\C-?)

(bind-key "C-/" 'undo)
(bind-key "C-z" 'undo)
(bind-key "M-w" 'easy-kill)
(bind-key "C-c C-s" 'shell-command)
(bind-key "C-t" 'other-window)
(bind-key "M-@" 'toggle-input-method)
(bind-key "C-c ;" 'comment-or-uncomment-region)
(setq comment-style 'multi-line)
(bind-key "C-8" 'backward-list)
(bind-key "C-9" 'forward-list)

(global-set-key [M-right] 'split-window-horizontally)
(global-set-key [M-left] 'split-window-horizontally)
(global-set-key [M-up] 'split-window-vertically)
(global-set-key [M-down] 'delete-other-windows)

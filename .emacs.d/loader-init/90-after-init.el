(add-hook 'after-init-hook (lambda()
    (set-frame-position (selected-frame) 0 0)
    (set-frame-size (selected-frame) 94 47)
    (setq w (selected-window))
    (setq w2 (split-window w (- (window-height w) 8)))
    (select-window w2)
    (multi-term)
    (select-window w)
    (recentf-open-files)))

(defun reset-window()
  (interactive)
    (delete-other-windows)
    (set-frame-position (selected-frame) 0 0)
    (set-frame-size (selected-frame) 94 47)
    (setq w (selected-window))
    (setq w2 (split-window w (- (window-height w) 8))))

(cond 
 ((or (eq window-system 'ns) (eq window-system 'mac))
    (add-hook 'after-init-hook (lambda()
        (set-frame-position (selected-frame) 0 0)
        (set-frame-size (selected-frame) 91 47)
        )))
((eq system-type 'gnu/linux)
    (add-hook 'after-init-hook (lambda()
        (set-frame-position (selected-frame) 0 0)
        (set-frame-size (selected-frame) 101 50)
        )))
)

(when (window-system)
    (add-hook 'after-init-hook (lambda()
        (setq w (selected-window))
        (setq w2 (split-window w (- (window-height w) 8)))
        (select-window w2)
        (multi-term)
        (select-window w)
        (recentf-open-files)
        ))
)

(unless (window-system)
(add-hook 'after-init-hook (lambda()
    (delete-window)
    (recentf-open-files)
    ))
  )

(defun reset-window()
  (interactive)
    (delete-other-windows)
    (setq w (selected-window))
    (setq w2 (split-window w (- (window-height w) 8)))
    )

;; check-frame-size
;; at *scratch*
;; (frame-height)
;; (frame-width)
;; C-j

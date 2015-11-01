;;for nw
(add-hook 'after-init-hook (lambda()
    (delete-window)
    (recentf-open-files)))

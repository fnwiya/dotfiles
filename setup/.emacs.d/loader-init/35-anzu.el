(add-hook 'after-init-hook (lambda()
    (global-anzu-mode +1)
    (custom-set-variables
     '(anzu-mode-lighter "")
     '(anzu-deactivate-region t)
     '(anzu-search-threshold 1000))
    ))

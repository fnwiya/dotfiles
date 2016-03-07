(use-package go-mode
  :mode
  (("\\.go\\'" . go-mode))
   :config
  (add-hook 'go-mode-hook (lambda ()
    (go-eldoc-setup)
    (add-hook 'before-save-hook 'gofmt-before-save)
  )))

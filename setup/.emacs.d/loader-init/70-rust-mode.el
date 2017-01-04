(use-package rust-mode
  :config
  (setq-default rust-format-on-save t)
  (add-hook 'rust-mode-hook (lambda ()
                              (racer-mode))))
(use-package flycheck-rust
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

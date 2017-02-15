(use-package rust-mode
  :config
  (add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))
  (eval-after-load "rust-mode"
    '(setq-default rust-format-on-save t))
  (add-hook 'rust-mode-hook (lambda ()
                              (racer-mode)
                              (flycheck-rust-setup)))
  (add-hook 'racer-mode-hook #'eldoc-mode))
(use-package company-racer
  :config
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-racer)))

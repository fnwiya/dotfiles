(use-package python
  :mode
  (("\\.py\\'" . python-mode))
  :config
  (auto-complete-mode nil)
  (setq indent-tabs-mode nil)
  (setq indent-level 4)
  (setq python-indent 4)
  (setq tab-width 4)
  )

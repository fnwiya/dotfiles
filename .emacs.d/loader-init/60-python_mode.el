(use-package python
  :mode
  (("\.py$" . python-mode))
  :config
  (setq indent-tabs-mode nil)
  (setq indent-level 4)
  (setq python-indent 4)
  (setq tab-width 4)
  )

(use-package highlight-indentation
  :config
  (add-hook 'python-mode-hook  'highlight-indentation-mode)
  (set-face-background 'highlight-indentation-face "#343d46")
)

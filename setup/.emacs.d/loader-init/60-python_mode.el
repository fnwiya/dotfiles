(use-package python
  :mode
  (("\.py$" . python-mode))
  :interpreter ("python" . python-mode)
  :config
  (setq indent-tabs-mode nil)
  (setq indent-level 4)
  (setq python-indent 4)
  (setq tab-width 4)
  )

(when (require 'elpy nil t)
  (elpy-enable)
  (setq elpy-rpc-backend "jedi"))

(use-package python
  :mode
  (("\\.py\\'" . python-mode))
  :config
  (if (equal system-name-simple "forcia-VirtualBox")
      (setq-default indent-tabs-mode t)
      (setq-default indent-tabs-mode nil)
      (setq indent-level 4)
      (setq tab-width 4))
  )

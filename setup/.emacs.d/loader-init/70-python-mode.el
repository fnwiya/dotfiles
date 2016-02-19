(use-package python
  :mode
  (("\\.py\\'" . python-mode))
  :config
  (setq py-indent-tabs-mode nil)
  (setq indent-level 4)
  (setq tab-width 4)
  (when (equal system-name-simple "forcia-VirtualBox")
      (setq indent-level 8)
      (setq tab-width 8)
      (setq python-indent 8)
      (setq py-indent-tabs-mode t))
   )

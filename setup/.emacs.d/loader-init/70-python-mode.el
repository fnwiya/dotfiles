(use-package python
  :mode
  (("\\.py\\'" . python-mode))
  :config
  (setq py-indent-tabs-mode nil)
  (setq indent-level 4)
  (setq tab-width 4)
  (when (equal system-name-simple "forcia-VirtualBox")
      (setq tab-width py-indent-offset)
      (setq py-indent-tabs-mode t))
   )

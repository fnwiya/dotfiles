(use-package ess
  :mode
  (("\\.[rR]$" . R-mode))
  :config
  (setq ess-ask-for-ess-directory nil) ;; 起動時にワーキングディレクトリを尋ねない
  (autoload 'R "ess-site" "start R" t)
  )

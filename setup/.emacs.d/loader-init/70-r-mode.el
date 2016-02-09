(use-package ess
  :mode
  (("\\.[rR]$" . R-mode))
  :config
  ;; 起動時にワーキングディレクトリを尋ねられないようにする
  (setq ess-ask-for-ess-directory nil)
  (autoload 'R "ess-site" "start R" t)
  )

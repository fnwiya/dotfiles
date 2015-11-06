(use-package ess
  :init
  (add-to-list 'auto-mode-alist '("\\.[rR]$" . R-mode))
  (autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)
  :config
  ;; 起動時にワーキングディレクトリを尋ねられないようにする
  (setq ess-ask-for-ess-directory nil)
  (autoload 'R "ess-site" "start R" t)
  )

(use-package python
  :mode
  (("\.py$" . python-mode))
  :config
  (setq indent-tabs-mode nil)
  (setq indent-level 4)
  (setq python-indent 4)
  (setq tab-width 4)
  )


; (require 'jedi)
; (add-hook 'python-mode-hook 'jedi:setup)
; (setq jedi:complete-on-dot t)
;; M-x jedi:install-server

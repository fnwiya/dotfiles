(use-package js2-mode
  :mode
  (("\.js$" . js2-mode)
   ("\.json$" . js2-mode))
  :config
  )
(use-package jquery-doc
  :commands (jquery-doc-setup)
  :init
  (add-hook 'js2-mode-hook 'jquery-doc-setup))
;;(use-package tern
;;  :commands (tern-mode)
;;  :init
;;  (add-hook 'js2-mode-hook 'tern-mode)
;;  :config
;;  )
;;(eval-after-load 'tern
;;  '(progn
;;    (require 'tern-auto-complete)
;;    (tern-ac-setup)))

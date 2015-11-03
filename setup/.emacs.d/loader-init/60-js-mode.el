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

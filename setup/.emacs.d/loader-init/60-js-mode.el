(use-package js2-mode
  :mode
  (("\.js$" . js2-mode)
   ("\.json$" . js2-mode)
   ("\.jsx$" . js2-jsx-mode))
  :config
  (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
  (add-hook 'js2-jsx-mode-hook 'flycheck-mode)
  (setq indent-level 4)
  )
(use-package jquery-doc
  :commands (jquery-doc-setup)
  :init
  (add-hook 'js2-mode-hook 'jquery-doc-setup)
  )

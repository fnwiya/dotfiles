(use-package js2-mode
  :mode
  (("\.js$" . js2-mode)
   ("\.json$" . js2-mode)
   ("\.jsx$" . js2-jsx-mode))
  :config
  (setq js2-include-browser-externs nil)
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  (setq js2-highlight-external-variables nil)
  (setq js2-include-jslint-globals nil)
  )
(use-package jquery-doc
  :commands (jquery-doc-setup)
  :init
  (add-hook 'js2-mode-hook 'jquery-doc-setup)
  )

(use-package clojure-mode
  )

(use-package cider
  :commands (cider-mode)
  :init
  (add-hook 'clojure-mode-hook 'cider-mode)
  )

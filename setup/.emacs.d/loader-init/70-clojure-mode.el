(use-package clojure-mode
  :mode
  (("\.clj$" . clojure-mode))
  )

(use-package cider
  :commands (cider-mode)
  :init
  (add-hook 'clojure-mode-hook 'cider-mode)
  )
(use-package clj-refactor)

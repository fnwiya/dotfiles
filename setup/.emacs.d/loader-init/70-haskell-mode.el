(use-package haskell-mode
  :mode
  (("\\.hs\\'" . haskell-mode))
  :config
  )
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))

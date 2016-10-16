(use-package haskell-mode
  :mode
  (("\\.hs\\'" . haskell-mode))
  :config
  (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
  (add-hook 'haskell-mode-hook 'font-lock-mode)
  (add-hook 'haskell-mode-hook 'imenu-add-menubar-index)
  (custom-set-variables
   '(haskell-indent-after-keywords (quote 
                                    (("where" 4 0) 
                                     ("of" 4) 
                                     ("do" 4) 
                                     ("mdo" 4) 
                                     ("rec" 4) 
                                     ("in" 4 0) 
                                     ("{" 4) 
                                     "if" "then" "else" "let")))
   '(haskell-indent-offset 4)
   '(haskell-indent-spaces 4))
  )
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))
(use-package ghc
  :config
  (autoload 'ghc-init "ghc" nil t)
  (autoload 'ghc-debug "ghc" nil t)
  (add-hook 'haskell-mode-hook (lambda () (ghc-init))))

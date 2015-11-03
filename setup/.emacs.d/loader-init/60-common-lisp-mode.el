(setq inferior-lisp-program "/usr/local/bin/sbcl")

(use-package slime
  :commands
  (slime)
  :config
  (slime-setup '(slime-repl slime-fancy slime-banner))
  )

(use-package ac-slime
  :commands
  (set-up-slime-ac)
  :init
  (add-hook 'slime-mode-hook 'set-up-slime-ac)
  (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
  (eval-after-load "auto-complete"
    '(add-to-list 'ac-modes 'slime-repl-mode))
  :config
)

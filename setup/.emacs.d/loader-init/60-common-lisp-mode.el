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
  :config
)

(add-hook 'slime-repl-mode-hook
   '(lambda ()
      (setq indent-tabs-mode nil)
      (define-key slime-repl-mode-map "\C-c\M-r" 'slime-restart-inferior-lisp)))

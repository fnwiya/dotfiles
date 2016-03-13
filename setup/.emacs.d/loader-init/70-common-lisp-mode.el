(setq inferior-lisp-program "/usr/local/bin/sbcl")

(add-to-list 'auto-mode-alist '("\.cl$" . lisp-mode))
(add-to-list 'auto-mode-alist '("\.lisp$" . lisp-mode))

(use-package slime
  :commands
  (slime)
  :config
  (slime-setup '(slime-repl slime-fancy slime-banner))
  )

(add-hook 'slime-repl-mode-hook
   '(lambda ()
      (define-key slime-repl-mode-map "\C-c\M-r" 'slime-restart-inferior-lisp)
      ))

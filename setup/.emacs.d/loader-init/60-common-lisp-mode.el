(setq inferior-lisp-program "/usr/local/bin/sbcl")

(use-package slime
  :commands
  (slime)
  :config
  (slime-setup '(slime-repl slime-fancy slime-banner))
  )

(add-hook 'slime-repl-mode-hook
   '(lambda ()
      (define-key slime-repl-mode-map "\C-c\M-r" 'slime-restart-inferior-lisp)
      (define-key slime-repl-mode-map "C-8" 'backward-list)
      (define-key slime-repl-mode-map "C-9" 'forward-list)
      ))
(add-hook 'lisp-mode-hook
   '(lambda ()
      (define-key lisp-mode-map "C-8" 'backward-list)
      (define-key lisp-mode-map "C-9" 'forward-list)
      ))
(add-hook 'lisp-interaction-mode-hook
   '(lambda ()
      (define-key lisp-interaction-mode-map "C-8" 'backward-list)
      (define-key lisp-interaction-mode-map "C-9" 'forward-list)
      ))

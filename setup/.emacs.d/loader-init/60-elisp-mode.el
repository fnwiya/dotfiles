(add-to-list 'auto-mode-alist '("\.el$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\.elc$" . emacs-lisp-mode))
(add-hook 'emacs-lisp-mode-hook
   '(lambda ()
      (define-key emacs-lisp-mode-map "C-8" 'backward-list)
      (define-key emacs-lisp-mode-map "C-9" 'forward-list)
      ))

(defvar *rainbow-mode-hooks*
  '(css-mode-hook
    scss-mode-hook
    html-mode-hook
    emacs-lisp-mode-hook
    js2-mode-hook
   ))

(use-package rainbow-mode
  :commands (rainbow-mode)
  :init
  (loop for hook in *rainbow-mode-hooks*
        do (add-hook hook 'rainbow-mode))
  :config
  )

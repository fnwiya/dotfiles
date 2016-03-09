(use-package ruby-mode
  :mode
  (("\\.rb$" . ruby-mode)
   ("Capfile$" . ruby-mode)
   ("Gemfile$" . ruby-mode))
  :config
  (add-hook 'ruby-mode-hook
          '(lambda ()
             (setq tab-width 2)
             (setq ruby-indent-level tab-width)
             (setq ruby-deep-indent-paren-style nil)
             (define-key ruby-mode-map [return] 'ruby-reindent-then-newline-and-indent))))

(use-package ruby-block
  :config
  (ruby-block-mode t)
  (setq ruby-block-highlight-toggle t))

(use-package ruby-end)

(use-package cc-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
  (cond
    ((or (eq window-system 'ns) (eq window-system 'mac))
     (add-hook 'c-mode-common-hook
            (lambda ()
              (setq indent-tabs-mode nil)
              (setq c-basic-offset 2)
              )))
    ((eq system-type 'gnu/linux)
     (add-hook 'c-mode-common-hook
            (lambda ()
              (setq indent-tabs-mode t)
              (setq c-basic-offset 4)
              )))))
(use-package google-c-style
  :config
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c++-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent))
(use-package c-eldoc
  :config
  (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
  (add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)
  (setq c-eldoc-buffer-regenerate-time 60))

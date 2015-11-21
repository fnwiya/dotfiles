(require 'cc-mode)
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq indent-tabs-mode nil)  ;; タブは利用しない
            (setq c-basic-offset 2)      ;; indent は 2 スペース
            (setq c-auto-newline t) ;; ';' を入力したら、自動改行+インデント
            ))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(use-package google-c-style
  :init
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  :commands
  (google-set-c-style)
  :config
)

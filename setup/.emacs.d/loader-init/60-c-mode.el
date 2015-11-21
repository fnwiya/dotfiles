(use-package google-c-style
  :init
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent)
  :commands
  (google-set-c-style)
  :config
  ;; センテンスの終了である ';' を入力したら、自動改行+インデント
  (c-toggle-auto-hungry-state 1)
)

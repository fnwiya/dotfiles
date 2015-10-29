(use-package google-c-style
  :config
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent)
)

(add-hook 'c-mode-common-hook
          '(lambda ()
             (load "c-eldoc")
             ;; センテンスの終了である ';' を入力したら、自動改行+インデント
             (c-toggle-auto-hungry-state 1)
             ;; RET キーで自動改行+インデント
             (define-key c-mode-base-map "\C-m" 'newline-and-indent)
             (set (make-local-variable 'eldoc-idle-delay) 0.20)
             (c-turn-on-eldoc-mode)
             ))

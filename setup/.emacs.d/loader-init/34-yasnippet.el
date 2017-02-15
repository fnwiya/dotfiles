;; (add-to-list 'load-path
;;              (expand-file-name "~/.emacs.d/elisp/yasnippet"))
(use-package yasnippet
  :diminish yas-minor-mode
  :commands
  (yas-global-mode)
  :init
  (loop for hook in *programing-hooks*
        do (add-hook hook 'yas-global-mode))
  :config
  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets"
          "~/.emacs.d/elisp/yasnippet/snippets"
          ))
  (custom-set-variables '(yas-trigger-key "C-i"))
  (define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)     ; 既存スニペットを挿入
  (define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)        ; 新規スニペットを作成
  (define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file) ; 既存スニペットを閲覧・編集
  )

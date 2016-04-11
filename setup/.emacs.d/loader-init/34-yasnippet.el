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
          ;;"~/.emacs.d/elisp/yasnippet/snippets"
          ))
  ;; 既存スニペットを挿入する
  (define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
  ;; 新規スニペットを作成するバッファを用意する
  (define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
  ;; 既存スニペットを閲覧・編集する
  (define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)
  )

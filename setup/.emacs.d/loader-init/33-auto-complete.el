;; file名の補完で大文字小文字を区別しない
(setq completion-ignore-case t)

(use-package auto-complete-config
  :commands (auto-complete-mode)
  :init
  (loop for hook in *programing-hooks*
        do (add-hook hook 'auto-complete-mode))
  (setq ac-comphist-file "~/.emacs.d/cache/ac-comphist.dat")
  :config
  (ac-config-default)
  (add-to-list 'ac-modes 'text-mode)
  (add-to-list 'ac-modes 'fundamental-mode)
  (add-to-list 'ac-modes 'org-mode)
  (add-to-list 'ac-modes 'yatex-mode)
  (add-to-list 'ac-modes 'sql-mode)
  (ac-set-trigger-key "TAB")
  (setq ac-use-menu-map t)
  (define-key ac-completing-map (kbd "C-n") 'ac-next)
  (define-key ac-completing-map (kbd "C-p") 'ac-previous)
  (define-key ac-completing-map (kbd"C-m") 'ac-complete)
  (setq ac-use-fuzzy t)          ;; 曖昧マッチ
)

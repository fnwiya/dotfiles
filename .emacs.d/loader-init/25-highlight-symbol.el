(use-package highlight-symbol
  :commands (highlight-symbol-mode)
  :init
  (loop for hook in *programing-hooks*
        do (add-hook hook 'highlight-symbol-mode))
  :config
;;  (global-set-key [(control f4)] 'highlight-symbol-at-point)
;;  (global-set-key [f4] 'highlight-symbol-next)
;;  (global-set-key [(shift f4)] 'highlight-symbol-prev)
;;  (global-set-key [(meta f4)] 'highlight-symbol-query-replace)
  (setq highlight-symbol-idle-delay 0.3)
  )

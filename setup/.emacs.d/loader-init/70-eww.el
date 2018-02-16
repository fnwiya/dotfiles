(use-package eww
  :commands (eww)
  :config
  (setq eww-search-prefix "http://www.google.co.jp/search?q=")
  (defadvice linum-on(around my-linum-eww-on() activate)
    (unless (eq major-mode 'eww-mode) ad-do-it))
  ;; 背景の白みを消す
  (defvar eww-disable-colorize t)
  (defun shr-colorize-region--disable (orig start end fg &optional bg &rest _)
    (unless eww-disable-colorize
      (funcall orig start end fg)))
  (advice-add 'shr-colorize-region :around 'shr-colorize-region--disable)
  (advice-add 'eww-colorize-region :around 'shr-colorize-region--disable)
  (defun eww-disable-color ()
    "eww で文字色を反映させない"
    (interactive)
    (setq-local eww-disable-colorize t)
    (eww-reload))
  (defun eww-enable-color ()
    "eww で文字色を反映させる"
    (interactive)
    (setq-local eww-disable-colorize nil)
    (eww-reload))
  ;; ewwを複数立ち上げる
  (defun eww-mode-hook--rename-buffer ()
  "Rename eww browser's buffer so sites open in new page."
  (rename-buffer "eww" t))
  (add-hook 'eww-mode-hook 'eww-mode-hook--rename-buffer)
  (add-hook 'eww-after-render-hook (lambda ()
           (highlight-regexp eww-hl-search-word)
           (setq eww-hl-search-word nil)))
  ;; 検索ワードをハイライト
  (add-hook 'eww-after-render-hook (lambda ()
           (highlight-regexp eww-hl-search-word)
           (setq eww-hl-search-word nil)))
  ;; キーバインド
  (define-key eww-mode-map "r" 'eww-reload)
  (define-key eww-mode-map "c 0" 'eww-copy-page-url)
  (define-key eww-mode-map "p" 'scroll-down)
  (define-key eww-mode-map "n" 'scroll-up))
(use-package ace-link
  :config
  (eval-after-load 'eww '(define-key eww-mode-map "f" 'ace-link-eww))
  (ace-link-setup-default))

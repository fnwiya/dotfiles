(add-hook 'dired-mode-hook (lambda()
  (use-package wdired
    :config
    (setq dired-isearch-filenames t) ; diredバッファでC-sした時にファイル名だけにマッチ
    (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode) ;; wdiredモードに入る
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file) ;; 新規バッファを作らずにディレクトリを開く(デフォルトは「a」)
    (define-key dired-mode-map "a" 'dired-advertised-find-file)))) ;; 「a」を押したときに新規バッファを作って開く

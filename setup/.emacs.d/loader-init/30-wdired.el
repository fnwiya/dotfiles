(add-hook 'dired-mode-hook (lambda()
(use-package wdired
  :config
  ;; diredバッファでC-sした時にファイル名だけにマッチするように
  (setq dired-isearch-filenames t)
  ;; wdiredモードに入るキー(下の例では「r」)
  (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
  ;; 新規バッファを作らずにディレクトリを開く(デフォルトは「a」)
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  ;; 「a」を押したときに新規バッファを作って開くようにする
  (define-key dired-mode-map "a" 'dired-advertised-find-file)
  )
))

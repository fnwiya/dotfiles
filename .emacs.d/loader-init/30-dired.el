(add-hook 'dired-load-hook
          '(lambda ()
             ;; diredバッファでC-sした時にファイル名だけにマッチするように
             (setq dired-isearch-filenames t)
           (use-package wdired
             :config
             ;; wdiredモードに入るキー(下の例では「r」)
             (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
             ;; 新規バッファを作らずにディレクトリを開く(デフォルトは「a」)
             (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
             ;; 「a」を押したときに新規バッファを作って開くようにする
             (define-key dired-mode-map "a" 'dired-advertised-find-file)
           )))

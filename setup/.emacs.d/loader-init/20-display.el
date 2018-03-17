(setq inhibit-startup-screen t)   ; スタートアップ画面
(setq initial-scratch-message "") ; scratchの初期メッセージ消去
(set-frame-parameter (selected-frame) 'alpha '(90 90)) ; 透過
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (window-system)
  (scroll-bar-mode -1))

;; タイトルバー
(when (window-system)
  (run-with-timer 5 5 (lambda ()
  (setq frame-title-format
     (if (buffer-file-name)
         (format "[%%f]")
         (format "[%%b]"))))))

;; 行番号を表示
(use-package linum
  :commands (linum-mode)
  :init
  (loop for hook in *programing-hooks*
        do (add-hook hook 'linum-mode))
  :config
  (setq linum-format "%04d|"))

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq-default line-spacing 0) ; 行間
            (global-hl-line-mode t)       ; 現在の行をハイライト
            (transient-mark-mode 1)       ; リージョンを色付きにする
            (setq uniquify-buffer-name-style 'post-forward-angle-brackets) ; filename<dir> 形式のバッファ名にする
            (blink-cursor-mode 0) ; cursor の blink を止める
            (show-paren-mode t)   ; 対応するカッコを強調表示
            (setq show-paren-style 'mixed)
            (auto-image-file-mode t))) ; 画像ファイルを表示

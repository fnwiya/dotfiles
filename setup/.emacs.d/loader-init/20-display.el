;; 透過
(set-frame-parameter (selected-frame) 'alpha '(95 90))

;; スタートアップ画面
(setq inhibit-startup-screen t)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

(add-hook 'after-init-hook (lambda()
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; タイトルバー
(when (window-system)
(defadvice title-time-set (around title-time-set-around)
  (setq frame-title-format
        (if (buffer-file-name)
          (concat display-time-string " - " "%f")
          (concat display-time-string " - " "%b")
      )))
(ad-activate 'title-time-set)
(setq display-time-interval 30)
(setq display-time-string-forms
      '((format " [ %s/%02d/%02d (%s) - %s:%s ] "
                year (string-to-number month)(string-to-number day)
                dayname 24-hours minutes)))
(use-package title-time)
(display-time)
)

;; 行間
(setq-default line-spacing 0)

;; 行番号を表示
(use-package linum
  :commands (linum-mode)
  :init
  (loop for hook in *programing-hooks*
        do (add-hook hook 'linum-mode))
  :config
  (setq linum-format "%04d|")
)

;; 現在の行をハイライト
(global-hl-line-mode t)

;; リージョンを色付きにする
(transient-mark-mode 1)

;; filename<dir> 形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; cursor の blink を止める
(blink-cursor-mode 0)

;; 対応するカッコを強調表示
(show-paren-mode t)
(setq show-paren-style 'mixed)

;; 画像ファイルを表示
(auto-image-file-mode t)
))

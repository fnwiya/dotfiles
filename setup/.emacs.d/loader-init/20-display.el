;; 透過
(set-frame-parameter (selected-frame) 'alpha '(95 90))

;; スタートアップ画面
(setq inhibit-startup-screen t)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
      (format "%%f - Emacs@fnwiya" (system-name)))

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

;; 行間
(setq-default line-spacing 0)

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

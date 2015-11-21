;; スタートアップ画面
(setq inhibit-startup-screen t)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

(add-hook 'after-init-hook (lambda()
;; 透過
(set-frame-parameter (selected-frame) 'alpha '(95 90))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
))

;; タイトルバー
(when (window-system)
  (run-with-timer 5 5 (lambda ()
  (setq display-time-day-and-date t)
  (setq display-time-24hr-format t)
  (setq display-time-string-forms
    '((if display-time-day-and-date
      (format "%s/%s/%s " year month day)
        "")
      (format "%s:%s%s"
        (if display-time-24hr-format 24-hours 12-hours)
        minutes
        (if display-time-24hr-format "" am-pm))))
  (display-time)
  (setq frame-title-format
    (concat "[" display-time-string "]"
            " - "
            (if (buffer-file-name)
            (format "%%f")
            (format "%%b"))))
)))

;; 行番号を表示
(use-package linum
  :commands (linum-mode)
  :init
  (loop for hook in *programing-hooks*
        do (add-hook hook 'linum-mode))
  :config
  (setq linum-format "%04d|")
)

(add-hook 'emacs-startup-hook (lambda ()
;; 行間
(setq-default line-spacing 0)

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

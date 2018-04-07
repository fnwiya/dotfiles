;;; ユーザー情報
(setq user-full-name "fnwiya")
(setq user-mail-address "fnwiya@gmail.com")

;; バックアップファイルを作らないようにする
(setq make-backup-files nil)

(setq abbrev-file-name "~/.emacs.d/cache/abbrev_defs")
(setq auto-save-list-file-prefix "~/.emacs.d/cache/auto-save-list/")

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)

;;;クライアントを終了するとき終了するかどうかを聞かない
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;;; symlinkは必ず追いかける
(setq vc-follow-symlinks t)

;; 警告音もフラッシュも全て無効
(setq ring-bell-function 'ignore)

;;; カーソルの場所を保存する
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/cache/places")

;;; 同じ内容を履歴に記録しないようにする
(setq history-delete-duplicates t)

;;; 履歴をたくさん保存する
(setq history-length 1000)

;; 最後に改行を追加
(setq require-final-newline nil)

;; バッファ自動再読み込み
(global-auto-revert-mode 1)

(require 'server)
(unless (server-running-p)
  (server-start))

;;; デフォルトのタブ幅を 4 に設定
(setq-default tab-width 4)

;; M-wやC-kでコピーしたものを、他のアプルケーションで貼り付け可能にする
(cond (window-system
       (setq x-select-enable-clipboard t))
      )
      ;; ((and (not window-system) (eq system-type 'gnu/linux))
      ;;  (setq interprogram-paste-function
      ;;        (lambda ()
      ;;          (shell-command-to-string "xsel -b -o")))
      ;;  (setq interprogram-cut-function
      ;;        (lambda (text &optional rest)
      ;;          (let* ((process-connection-type nil)
      ;;                 (proc (start-process "xsel" "*Messages*" "xsel" "-b" "-i")))
      ;;            (process-send-string proc text)
      ;;            (process-send-eof proc))))))

;; 矩形選択
(cua-mode t)

;; タブの無効化
(if (equal user-login-name "forcia")
    (setq-default indent-tabs-mode t)
    (setq-default indent-tabs-mode nil))

;; 複数ウィンドウを禁止する
(setq ns-pop-up-frames nil)

;; C-k １回で行全体を削除する
(setq kill-whole-line t)

;; C-c c で compile コマンドを呼び出す
(define-key mode-specific-map "c" 'compile)

;; Macのoptionをメタキーにする
(setq mac-option-modifier 'meta)

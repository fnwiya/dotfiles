;;; ユーザー情報
(setq user-full-name "fnwiya")
(setq user-mail-address "fnwiya@gmail.com")

;; バックアップファイルを作らないようにする
(setq make-backup-files nil)

(setq auto-save-list-file-prefix "~/.emacs.d/cache/auto-save-list/")

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)

(run-with-timer 5 nil (lambda ()
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
(setq require-final-newline t)

;; バッファ自動再読み込み
(global-auto-revert-mode 1)

(require 'server)
(unless (server-running-p)
  (server-start))

;;; デフォルトのタブ幅を 4 に設定
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; M-wやC-kでコピーしたものを、他のアプルケーションで貼り付け可能にする
(cond (window-system
       (setq x-select-enable-clipboard t)))

;; 矩形選択
(cua-mode t)
))

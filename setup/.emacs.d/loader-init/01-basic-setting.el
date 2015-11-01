;;; ユーザー情報
(setq user-full-name "fnwiya")
(setq user-mail-address "fnwiya@gmail.com")

;; 警告音もフラッシュも全て無効
(setq ring-bell-function 'ignore)

;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)

;; バックアップファイルを作らないようにする
(setq make-backup-files nil)

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;; カーソルの場所を保存する
(use-package saveplace
  :config
  (setq-default save-place t)
  (setq save-place-file "~/.emacs.d/cache/places")
  )

(setq auto-save-list-file-prefix "~/.emacs.d/cache/auto-save-list/")

;;; 同じ内容を履歴に記録しないようにする
(setq history-delete-duplicates t)

;;; 履歴をたくさん保存する
(setq history-length 1000)

;; 最後に改行を追加
(setq require-final-newline t)

;; バッファ自動再読み込み
(global-auto-revert-mode 1)

(use-package server
  :config
  (unless (server-running-p)
  (server-start))
)

;;; デフォルトのタブ幅を 4 に設定
(setq-default tab-width 4)

;; M-wやC-kでコピーしたものを、他のアプルケーションで貼り付け可能にする
(cond (window-system
       (setq x-select-enable-clipboard t)))

;; 矩形選択
(cua-mode t)

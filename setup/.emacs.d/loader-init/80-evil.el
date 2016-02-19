;; http://tarao.hatenablog.com/entry/20130304/evil_config
(use-package evil
  :init
  ;; before (evil-mode 1)
  (setq evil-cross-lines t)                ; 行の端でhlしたとき前/次の行に移動する
  (setq evil-move-cursor-back nil)         ; 改行文字の上に移動可能にする(C-x C-e用)
  (setq evil-want-C-i-jump nil)            ; C-iはTABとして使う
  (setq evil-search-module 'evil-search)   ; evil-search/isearch
  (setq evil-ex-search-vim-style-regexp t) ; serch-moduleがevil-searchの場合に有効化
  (setq evil-esc-delay 0)
  ;; /before (evil-mode 1)
  :config
  (evil-mode 1)
  ;;cursor-color
  (setq evil-emacs-state-cursor    '("#E74C3C" box))
  (setq evil-normal-state-cursor   '("#3498DB" box))
  (setq evil-visual-state-cursor   '("#2ECC71" box))
  (setq evil-insert-state-cursor   '("#E74C3C" bar))
  (setq evil-replace-state-cursor  '("#E67E22" bar))
  (setq evil-operator-state-cursor '("#E74C3C" hollow))
  ;;その他の設定
  (modify-syntax-entry ?_ "w" (standard-syntax-table)) ; 「_」を単語の一部とみなす
  (setq evil-want-fine-undo t)                         ; 操作を元に戻す単位を細かくする
  ;; (run-with-idle-timer 5 t 'evil-normal-state)      ; 一定時間操作しないとノーマルモードに戻る
  (evil-set-initial-state 'term-mode 'emacs)
  )

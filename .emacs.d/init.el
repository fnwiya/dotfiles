;;; -*- Mode: Emacs-Lisp; Coding: utf-8 -*-

;;; ~/.emacs.d/
(unless (boundp 'user-emacs-directory)
  (defvar user-emacs-directory (expand-file-name "~/.emacs.d/")))

;;; ユーザー情報
(setq user-full-name "fnwiya")

;;; バックアップ・自動保存
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq vc-make-backup-files nil)
;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)


;; バッファの内容を自動保管 (秒)
(require 'auto-save-buffers-enhanced)
(setq auto-save-buffers-enhanced-interval 5) ; 指定のアイドル秒で保存
(auto-save-buffers-enhanced t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Emacs Lisp パッケージ管理
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 言語環境、日本語入力など
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 言語環境
(set-language-environment "Japanese")

;; コーディングシステム

(cond
 ;; Windows
 ;; gnupack 設定ファイルから
 ((eq system-type 'windows-nt)
  (set-keyboard-coding-system 'cp932)
  (prefer-coding-system 'utf-8-dos)
  (set-file-name-coding-system 'cp932)
  (setq default-process-coding-system '(cp932 . cp932)))
 (t 
  (prefer-coding-system 'utf-8)))

;; 日本語入力の設定
(cond
 ;; Cocoa Emacs, 日本語化パッチ
 ((and (eq window-system 'ns)
       (functionp 'mac-set-input-method-parameter))
  (setq default-input-method "MacOSX")
  ;; "Convert yen to backslash for JIS keyboard."
  ;; (mac-translate-from-yen-to-backslash)
  ;; Shift キーがシステム・IM に渡るようにする
  (mac-add-key-passed-to-system 'shift)
  ;; 起動したら英字にする
  (add-hook 'after-init-hook 'mac-change-language-to-us)
  ;; ミニバッファを開いたときに英字にする（閉じてもモードは戻らない）
  (add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)
  ;; Input Source ごとのカスタマイズ
  ;; - 一覧は (mac-get-input-source-list) で取得できる。
  ;; - ATOK はバージョンごとに ID が変わる。年に一回なのでとりあえず手動更新で対応。
  (mac-set-input-method-parameter "com.justsystems.inputmethod.atok27.Japanese" `title "あ")
  (mac-set-input-method-parameter "com.justsystems.inputmethod.atok27.Japanese" `cursor-color "darkred")
  (mac-set-input-method-parameter "com.justsystems.inputmethod.atok27.Roman" `cursor-color "black")
  )
 ;; Windows
 ;; gnupack 設定ファイルから
 ((eq system-type 'windows-nt)
  (setq default-input-method "W32-IME")
  (setq-default w32-ime-mode-line-state-indicator "[Aa]")
  (setq w32-ime-mode-line-state-indicator-list '("[Aa]" "[あ]" "[Aa]"))
  (w32-ime-initialize)
  ;; IME の ON/OFF でカーソルの色を変える
  (set-cursor-color "black")
  (add-hook 'input-method-activate-hook
            (lambda() (set-cursor-color "darkred")))
  (add-hook 'input-method-inactivate-hook
            (lambda() (set-cursor-color "black")))
  ;; バッファ切り替え時にIME状態を引き継ぐ
  (setq w32-ime-buffer-switch-p nil)
  )
 )

;; encode の設定
(when (eq system-type 'windows-nt)
  ;; gnupack 設定ファイルから

  ;; 機種依存文字
  (require 'cp5022x)
  (define-coding-system-alias 'euc-jp 'cp51932)

  ;; decode-translation-table の設定
  (coding-system-put 'euc-jp :decode-translation-table
                     (get 'japanese-ucs-jis-to-cp932-map 'translation-table))
  (coding-system-put 'iso-2022-jp :decode-translation-table
                     (get 'japanese-ucs-jis-to-cp932-map 'translation-table))
  (coding-system-put 'utf-8 :decode-translation-table
                     (get 'japanese-ucs-jis-to-cp932-map 'translation-table))

  ;; encode-translation-table の設定
  (coding-system-put 'euc-jp :encode-translation-table
                     (get 'japanese-ucs-cp932-to-jis-map 'translation-table))
  (coding-system-put 'iso-2022-jp :encode-translation-table
                     (get 'japanese-ucs-cp932-to-jis-map 'translation-table))
  (coding-system-put 'cp932 :encode-translation-table
                     (get 'japanese-ucs-jis-to-cp932-map 'translation-table))
  (coding-system-put 'utf-8 :encode-translation-table
                     (get 'japanese-ucs-jis-to-cp932-map 'translation-table))

  ;; charset と coding-system の優先度設定
  (set-charset-priority 'ascii 'japanese-jisx0208 'latin-jisx0201
                        'katakana-jisx0201 'iso-8859-1 'cp1252 'unicode)
  (set-coding-system-priority 'utf-8 'euc-jp 'iso-2022-jp 'cp932)

  ;; PuTTY 用の terminal-coding-system の設定
  (apply 'define-coding-system 'utf-8-for-putty
         "UTF-8 (translate jis to cp932)"
         :encode-translation-table 
         (get 'japanese-ucs-jis-to-cp932-map 'translation-table)
         (coding-system-plist 'utf-8))
  (set-terminal-coding-system 'utf-8-for-putty)

  ;; East Asian Ambiguous
  (defun set-east-asian-ambiguous-width (width)
    (while (char-table-parent char-width-table)
      (setq char-width-table (char-table-parent char-width-table)))
    (let ((table (make-char-table nil)))
      (dolist (range 
               '(#x00A1 #x00A4 (#x00A7 . #x00A8) #x00AA (#x00AD . #x00AE)
                        (#x00B0 . #x00B4) (#x00B6 . #x00BA) (#x00BC . #x00BF)
                        #x00C6 #x00D0 (#x00D7 . #x00D8) (#x00DE . #x00E1) #x00E6
                        (#x00E8 . #x00EA) (#x00EC . #x00ED) #x00F0 
                        (#x00F2 . #x00F3) (#x00F7 . #x00FA) #x00FC #x00FE
                        #x0101 #x0111 #x0113 #x011B (#x0126 . #x0127) #x012B
                        (#x0131 . #x0133) #x0138 (#x013F . #x0142) #x0144
                        (#x0148 . #x014B) #x014D (#x0152 . #x0153)
                        (#x0166 . #x0167) #x016B #x01CE #x01D0 #x01D2 #x01D4
                        #x01D6 #x01D8 #x01DA #x01DC #x0251 #x0261 #x02C4 #x02C7
                        (#x02C9 . #x02CB) #x02CD #x02D0 (#x02D8 . #x02DB) #x02DD
                        #x02DF (#x0300 . #x036F) (#x0391 . #x03A9)
                        (#x03B1 . #x03C1) (#x03C3 . #x03C9) #x0401 
                        (#x0410 . #x044F) #x0451 #x2010 (#x2013 . #x2016)
                        (#x2018 . #x2019) (#x201C . #x201D) (#x2020 . #x2022)
                        (#x2024 . #x2027) #x2030 (#x2032 . #x2033) #x2035 #x203B
                        #x203E #x2074 #x207F (#x2081 . #x2084) #x20AC #x2103
                        #x2105 #x2109 #x2113 #x2116 (#x2121 . #x2122) #x2126
                        #x212B (#x2153 . #x2154) (#x215B . #x215E) 
                        (#x2160 . #x216B) (#x2170 . #x2179) (#x2190 . #x2199)
                        (#x21B8 . #x21B9) #x21D2 #x21D4 #x21E7 #x2200
                        (#x2202 . #x2203) (#x2207 . #x2208) #x220B #x220F #x2211
                        #x2215 #x221A (#x221D . #x2220) #x2223 #x2225
                        (#x2227 . #x222C) #x222E (#x2234 . #x2237)
                        (#x223C . #x223D) #x2248 #x224C #x2252 (#x2260 . #x2261)
                        (#x2264 . #x2267) (#x226A . #x226B) (#x226E . #x226F)
                        (#x2282 . #x2283) (#x2286 . #x2287) #x2295 #x2299 #x22A5
                        #x22BF #x2312 (#x2460 . #x24E9) (#x24EB . #x254B)
                        (#x2550 . #x2573) (#x2580 . #x258F) (#x2592 . #x2595) 
                        (#x25A0 . #x25A1) (#x25A3 . #x25A9) (#x25B2 . #x25B3)
                        (#x25B6 . #x25B7) (#x25BC . #x25BD) (#x25C0 . #x25C1)
                        (#x25C6 . #x25C8) #x25CB (#x25CE . #x25D1) 
                        (#x25E2 . #x25E5) #x25EF (#x2605 . #x2606) #x2609
                        (#x260E . #x260F) (#x2614 . #x2615) #x261C #x261E #x2640
                        #x2642 (#x2660 . #x2661) (#x2663 . #x2665) 
                        (#x2667 . #x266A) (#x266C . #x266D) #x266F #x273D
                        (#x2776 . #x277F) (#xE000 . #xF8FF) (#xFE00 . #xFE0F) 
                        #xFFFD
                        ))
        (set-char-table-range table range width))
      (optimize-char-table table)
      (set-char-table-parent table char-width-table)
      (setq char-width-table table)))
  (set-east-asian-ambiguous-width 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; フレーム、ウィンドウまわりのいろいろ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 透過
(set-frame-parameter (selected-frame) 'alpha '(95 90))

;; スタートアップ画面
(setq inhibit-startup-screen t)

;; メニューバー
(when window-system (menu-bar-mode +1))

;; ツールバー
(when window-system (tool-bar-mode -1))

;; スクロールバー
(when window-system (scroll-bar-mode -1))

;; フリンジに行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil :height 0.8)
(setq linum-format "%4d")

;; バッファ末尾より後の行では、フリンジ左側に何か表示される
(setq-default indicate-empty-lines t)

;; モードラインの行番号・桁番号
(line-number-mode t)
(column-number-mode t)

;; 一時バッファのサイズ
(temp-buffer-resize-mode +1)

;; 縦に（左右に）ウィンドウを分割した場合の折り返し
(setq truncate-partial-width-windows nil)

;; カーソル
(setq default-frame-alist
      (append (list
               '(cursor-type . box)
               '(cursor-height . 4)
               )
              default-frame-alist))
(when window-system (blink-cursor-mode -1))

;; 非アクティブウィンドウのカーソル
(setq-default cursor-in-non-selected-windows nil)

;; フォントロック
(global-font-lock-mode +1)
(setq font-lock-support-mode
      (if (fboundp 'jit-lock-mode) 'jit-lock-mode 'lazy-lock-mode))

;; 一般的な設定ファイルなどの構文強調表示
;; http://at-aka.blogspot.jp/2011/03/emacs-etchosts-etcapache2conf.html
(require 'generic-x)

;; 対応するカッコを強調表示
(show-paren-mode t)
(setq show-paren-style 'mixed) ; `parenthesis' or `expression' or `mixed'

;; 行ハイライト
(global-hl-line-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; フォントセットまわり
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq scalable-fonts-allowed t)

(when (eq window-system 'ns)
  (setq ns-antialias-text t))

(cond
 ;; Cocoa Emacs
 ((and (eq window-system 'ns)
       (or (and (= emacs-major-version 23) (>= emacs-minor-version 3))
           (= emacs-major-version 24))
       )
  ;; Cocoa Emacs のフォント設定について - 瀬戸亮平
  ;; http://d.hatena.ne.jp/setoryohei/20110117/1295336454
  (let* ((size 12) ; ASCIIフォントのサイズ [9/10/12/14/15/17/19/20/...]
         (asciifont "Menlo") ; ASCIIフォント
         (jpfont "Hiragino Maru Gothic Pro") ;; 日本語フォント
         (h (* size 10))
         (fontspec (font-spec :family asciifont))
         (jp-fontspec (font-spec :family jpfont))
         (osaka-fontspec (font-spec :family "Osaka"))
         )
    (set-face-attribute 'default nil :family asciifont :height h)
    (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec)
    (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec)
    (set-fontset-font nil 'katakana-jisx0201 jp-fontspec) ; 半角カナ
    (set-fontset-font nil '(#x0080 . #x024F) fontspec) ; 分音符付きラテン
    ;; (set-fontset-font nil '(#x0370 . #x03FF) fontspec) ; ギリシャ文字
    (set-fontset-font nil '(#x0370 . #x03FF) jp-fontspec) ; ギリシャ文字
    (set-fontset-font nil '#xFF0B osaka-fontspec) ; ＋（プラス）
    (set-fontset-font nil '#x2212 osaka-fontspec) ; −（マイナス）
    (set-fontset-font nil '#x00B1 osaka-fontspec) ; ±（プラスマイナス）
    (set-fontset-font nil '#x00D7 osaka-fontspec) ; ×（かける）
    (set-fontset-font nil '#x00F7 osaka-fontspec) ; ÷（わる）
    )

  ;; フォントサイズの比を設定
  (dolist (elt '(("^-apple-hiragino.*" . 1.2)
                 (".*osaka-bold.*" . 1.2)
                 (".*osaka-medium.*" . 1.2)
                 (".*courier-bold-.*-mac-roman" . 1.0)
                 (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
                 (".*monaco-bold-.*-mac-roman" . 0.9)))
    (add-to-list 'face-font-rescale-alist elt))

  ;; 123456789012345678901234567890
  ;; ABCDEFGHIJKLMNOPQRSTUVWXYZabcd
  ;; あいうえおかきくけこさしすせそ
  ;; ◎○●▲■◎○●▲■◎○●▲■
  ;; ×÷±＋−×÷±＋−×÷±＋−
  ;; 123456789012345678901234567890
  ;; ΑΒΓαβγΑΒΓαβγΑΒΓαβγΑΒΓαβγΑΒΓαβγ

  ;; フレームの縦横サイズ・位置
  (cond
   ((equal system-name "kawachoimac.local")
    (add-to-list 'default-frame-alist '(top . 50))
    (add-to-list 'default-frame-alist '(left . 0))
    (add-to-list 'default-frame-alist '(width . 150))
    (add-to-list 'default-frame-alist '(height . 90)))
   (t
    (add-to-list 'default-frame-alist '(width . 100))
    (add-to-list 'default-frame-alist '(height . 50)))
    )
  )
 ;; Windows, gnupack
 ;; gnupack の ini で設定されているのをそのまま使う。
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; その他の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; バッファメニューは別ウィンドウで
(global-set-key "\C-x\C-b" 'buffer-menu-other-window)

;; iswitchb
(iswitchb-mode +1)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; 他で変更されたら再読込
(global-auto-revert-mode +1)

;; 物理行移動
(setq line-move-visual nil)

;; スクロール
(setq scroll-step 1)
(setq scroll-margin 1) ;; C-l recenter
(setq scroll-conservatively 35)
; (setq next-screen-context-lines 1)

;; タブ
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; 自動詰め込み、折り返し
(setq-default fill-column 80)

;; 補完時の大文字小文字区別
(setq completion-ignore-case t)
;; (setq read-file-name-completion-ignore-case t)
;; (setq read-buffer-completion-ignore-case t)

;; 検索時の大文字小文字の区別
(setq-default case-fold-search t)



;;; init.el ends here

(setq-default mode-line-format
 '(; Position
   (:eval (format "%04d" (count-lines (point-max) (point-min))))
   (:propertize "(%04l" face mode-line-position-face)
   ":"
   (:propertize "%03c)"  face mode-line-position-face)
   ; emacsclient [default -- keep?]
   mode-line-client
   " "
   ; encode
   mode-line-mule-info
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;;［ファイルのコード系を示す文字の意味(日本語関係だけ)］
   ;; E -> 日本語 EUC
   ;; J -> 日本語 JIS
   ;; S -> 日本語 Shift-JIS
   ;; u -> Unicode
   ;; = -> 無変換
   ;;;［ファイルの改行コードを示す文字の意味］
   ;; :     -> UNIX 系の LF
   ;; (DOS) -> Windows 系の CR+LF
   ;; (Mac) -> Mac 系の CR
   ;;; [ファイルのコードの設定]
   ;; 「C-x RETURN f」と入力後、所望のコードを示す文字列を入力する。
   ;;;［設定用文字列とその意味］
   ;; euc-jp -> 日本語 EUC (改行コードが現在のものを保持)
   ;; junet  -> 日本語 JIS (改行コードが現在のものを保持)
   ;; sjis   -> 日本語 Shift-JIS (改行コードが現在のものを保持)
   ;;;［補足］
   ;; 上記文字列の後に、「-unix」、「-dos」、「-mac」を付けると、
   ;; それぞれ改行コードを「UNIX 系 LF」、「Windows 系の CR+LF」、
   ;; 「Mac 系の CR」に設定することができる。
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; evil-state
   (:eval
    (cond ((evil-insert-state-p)
           (propertize " I " 'face 'mode-line-modified-face))
          ((evil-visual-state-p)
           (propertize " V " 'face 'mode-line-modified-face))
          ((evil-emacs-state-p)
           (propertize " E " 'face 'mode-line-modified-face))
          ((evil-normal-state-p)
           (propertize " N " 'face 'mode-line-modified-face))
            (t" - ")))
   ; read-only or modified status
   (:eval
    (cond (buffer-read-only
           (propertize " RO " 'face 'mode-line-read-only-face))
          ((buffer-modified-p)
           (propertize " ** " 'face 'mode-line-modified-face))
          (t" -- ")))
   " "
   ; directory and buffer/file name
   (:propertize (:eval (shorten-directory default-directory 30))
                face mode-line-folder-face)
   (:propertize "%b"
                face mode-line-filename-face)
   ; narrow [default -- keep?]
   "%n"
   ; mode indicators: vc, recursive edit, major mode, minor modes, process, global
   (vc-mode vc-mode)
   " %["
   (:propertize mode-name
                face mode-line-mode-face)
   "%] "
   (:eval (propertize (format-mode-line minor-mode-alist)
                      'face 'mode-line-minor-mode-face))
   (:propertize mode-line-process
                face mode-line-process-face)
   (global-mode-string global-mode-string)
   " "
   ))

;; Helper function
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 5)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

;; Extra mode line faces
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-process-face)

(set-face-attribute 'mode-line nil
  :inverse-video nil
  :height 125
  :box nil)
(set-face-attribute 'mode-line-inactive nil
  :inverse-video nil
  :box nil)
(set-face-attribute 'mode-line-read-only-face nil
  :inherit 'mode-line-face
  :foreground (face-attribute 'link :foreground)
  :weight 'bold
  :box nil)
(set-face-attribute 'mode-line-modified-face nil
  :inherit 'mode-line-face
  :foreground (face-attribute 'warning :foreground)
  :weight 'bold
  :box nil)
(set-face-attribute 'mode-line-folder-face nil
  :inherit 'mode-line-face
  :foreground (face-attribute 'mode-line :foreground))
(set-face-attribute 'mode-line-filename-face nil
  :inherit 'mode-line-face
  :foreground (face-attribute 'cursor :background)
  :weight 'bold)
(set-face-attribute 'mode-line-position-face nil
  :inherit 'mode-line-face
  :height 100)
(set-face-attribute 'mode-line-mode-face nil
  :inherit 'mode-line-face
  :foreground (face-attribute 'mode-line :foreground))
(set-face-attribute 'mode-line-minor-mode-face nil
  :inherit 'mode-line-mode-face
  :foreground (face-attribute 'mode-line :foreground)
  :height 110)
(set-face-attribute 'mode-line-process-face nil
  :inherit 'mode-line-face
  :foreground (face-attribute 'mode-line :foreground))

;;http://www.bookshelf.jp/soft/meadow_16.html
(add-hook 'lisp-interaction-mode-hook
          '(lambda ()
             (setq mode-name "Lisp-Int")))
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (setq mode-name "Elisp")))

(add-hook 'emacs-startup-hook (lambda ()
(setq my/hidden-minor-modes
      '(
        auto-complete-mode
        rng-validate-mode
        undo-tree-mode
        ))

(mapc (lambda (mode)
          (setq minor-mode-alist
                (cons (list mode "") (assq-delete-all mode minor-mode-alist))))
        my/hidden-minor-modes)
))

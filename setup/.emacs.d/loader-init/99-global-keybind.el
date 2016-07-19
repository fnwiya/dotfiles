(define-key global-map [?¥] [?\\])

(keyboard-translate ?\C-h ?\C-?)

(bind-key "C-w C-w" 'other-window)
(bind-key "C-/" 'undo)
;; easy-kill cheatsheet
(bind-key "M-w" 'easy-kill) ; 行
;; M-w w 単語
;; M-w s S式
;; M-w l リスト
;; M-w f ファイル名
;; M-w d defun
;; M-w D 関数名
;; M-w e 行
(bind-key "C-c C-s" 'shell-command)
(bind-key "M-@" 'toggle-input-method)
(bind-key "C-c ;" 'comment-or-uncomment-region)
(setq comment-style 'multi-line)
(bind-key "C-8" 'backward-list)
(bind-key "C-9" 'forward-list)

(global-set-key [M-right] 'split-window-horizontally)
(global-set-key [M-left] 'split-window-horizontally)
(global-set-key [M-up] 'split-window-vertically)
(global-set-key [M-down] 'delete-other-windows)

(defun kill-word-at-point ()
  (interactive)
  (let ((char (char-to-string (char-after (point)))))
    (cond
     ((string= " " char) (delete-horizontal-space))
     ((string-match "[\t\n -@\[-`{-~]" char) (kill-word 1))
     (t (forward-char) (backward-word) (kill-word 1)))))
(bind-key "M-d" 'kill-word-at-point)

;; kill-lineで行が連結したときにインデントを減らす
(defadvice kill-line (before kill-line-and-fixup activate)
  (when (and (not (bolp)) (eolp))
    (forward-char)
    (fixup-whitespace)
    (backward-char)))

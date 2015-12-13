(define-key global-map [?¥] [?\\])

(keyboard-translate ?\C-h ?\C-?)

;; C-k １回で行全体を削除する
(setq kill-whole-line t)

;; C-c c で compile コマンドを呼び出す
(define-key mode-specific-map "c" 'compile)
;;(global-set-key (kbd "C-c c")
;;                '(lambda ()
;;                   (interactive)
;;                   (compile (format "gcc %s" buffer-file-name))))

(bind-key "C-/" 'undo)
(bind-key "C-z" 'undo)
(bind-key "M-w" 'easy-kill)
(bind-key "C-x C-x" 'smex)
(bind-key "C-x C-k" 'ido-kill-buffer)
(bind-key "C-t" 'other-window)
(bind-key "M-@" 'toggle-input-method)
(bind-key "C-c ;" 'comment-or-uncomment-region)
(setq comment-style 'multi-line)
(bind-key "C-[" 'backward-list)
(bind-key "C-]" 'forward-list)

(global-set-key [M-right] 'split-window-horizontally)
(global-set-key [M-left] 'split-window-horizontally)
(global-set-key [M-up] 'split-window-vertically)
(global-set-key [M-down] 'delete-other-windows)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Cheat Sheet(Global)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   |   C-     |   C-x   |   C-c   | C-x C-   | C-c C- |   M-    |
;; a: |seq-home  |         |    x    |quit-emacs|        |         |
;; b: |back      |helm-buff|    x    |helm-buff |        |         |
;; c: |prefix    |         | compile |          |        |         |
;; d: |delete    |         |         |          |        |         |
;; e: |seq-end   |         |         |          |        |         |
;; f: |forward   |         |         |find-file |        |         |
;; g: |quit      |         |         |          |        |         |
;; h: |backspace |         |         |          |        |         |
;; i: |yas-expand|         |         |          |        |         |
;; j: |new-line  |open-junk|         |          |        |         |
;; k: |kill-line |kill-buff|         |          |        |         |
;; l: |recenter  |         |         |          |        |         |
;; m: |new-line  |         |         |          |        |         |
;; n: |next-line |         |         |          |        |         |
;; o: |new-line  |other-win|         |          |        |         |
;; p: |pre-line  |         |         |twit-post |        |         |
;; q: |?         |         |         |view-mode |        |         |
;; r: |r-search  |         |         |recentf   |        |         |
;; s: |i-search  |         |         |save-buff |        |         |
;; t: |other-win |         |         |translate |        |         |
;; u: |?         |undo-tree|         |          |        |         |
;; v: |cua-paste |         |         |          |        |         |
;; w: |kill-reg  |         |         |          |        |easy-kill|
;; x: |prefix    |         |         |helm-M-x  |        |helm-M-x |
;; y: |cua-paste |         |         |          |        |         |
;; z: |undo      |         |         |          |        |         |
;;sp: |spotlight |         |ace-jump |          |        |         |

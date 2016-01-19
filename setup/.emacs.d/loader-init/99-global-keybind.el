(define-key global-map [?¥] [?\\])

(keyboard-translate ?\C-h ?\C-?)

(bind-key "C-/" 'undo)
(bind-key "C-z" 'undo)
(bind-key "M-w" 'easy-kill)
(bind-key "C-c C-s" 'shell-command)
(bind-key "C-t" 'other-window)
(bind-key "M-@" 'toggle-input-method)
(bind-key "C-c ;" 'comment-or-uncomment-region)
(setq comment-style 'multi-line)
(bind-key "C-8" 'backward-list)
(bind-key "C-9" 'forward-list)

(global-set-key [M-right] 'split-window-horizontally)
(global-set-key [M-left] 'split-window-horizontally)
(global-set-key [M-up] 'split-window-vertically)
(global-set-key [M-down] 'delete-other-windows)

(defun copy-whole-line (&optional arg)
  "Copy current line."
  (interactive "p")
  (or arg (setq arg 1))
  (if (and (> arg 0) (eobp) (save-excursion (forward-visible-line 0) (eobp)))
      (signal 'end-of-buffer nil))
  (if (and (< arg 0) (bobp) (save-excursion (end-of-visible-line) (bobp)))
      (signal 'beginning-of-buffer nil))
  (unless (eq last-command 'copy-region-as-kill)
    (kill-new "")
    (setq last-command 'copy-region-as-kill))
  (cond ((zerop arg)
         (save-excursion
           (copy-region-as-kill (point) (progn (forward-visible-line 0) (point)))
           (copy-region-as-kill (point) (progn (end-of-visible-line) (point)))))
        ((< arg 0)
         (save-excursion
           (copy-region-as-kill (point) (progn (end-of-visible-line) (point)))
           (copy-region-as-kill (point)
                                (progn (forward-visible-line (1+ arg))
                                       (unless (bobp) (backward-char))
                                       (point)))))
        (t
         (save-excursion
           (copy-region-as-kill (point) (progn (forward-visible-line 0) (point)))
           (copy-region-as-kill (point)
                                (progn (forward-visible-line arg) (point))))))
  (message (substring (car kill-ring-yank-pointer) 0 -1)))
(bind-key "C-x y" 'copy-whole-line)

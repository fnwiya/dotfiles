(defun my/filter (condp lst)
  (delq nil
        (mapcar (lambda (x) (and (funcall condp x) x)) lst)))
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (let* ((no-kill-buffer-names
          ;; 消さないバッファ名を指定
          (list (buffer-name (current-buffer))
                "*Messages*" "*Compile-Log*" "*Help*"
                "*init log*" "*Ibuffer*" "*scratch*"
                "*MULTI-TERM-DEDICATED*" "*eshell*"))
         (interested-buffers
          (my/filter
           '(lambda (buffer)
              (and
               ;; donk kill buffers who has the windows displayed in
               (not (get-buffer-window (buffer-name buffer)))
               ;; dont kill hidden buffers (hidden buffers' name starts with SPACE)
               (not (string-match "^ " (buffer-name buffer)))
               ;; dont kill buffers who have running processes
               (let ((proc (get-buffer-process buffer)))
                 (if proc
                     (equal 'exit
                            (process-status
                             (get-buffer-process buffer)))
                   t))))
           (buffer-list)))
         (buffers-to-kill
          (set-difference interested-buffers
                          (mapcar '(lambda (buffer-name)
                                     (get-buffer buffer-name))
                                  no-kill-buffer-names))))
    (mapc 'kill-buffer buffers-to-kill)))
(global-set-key (kbd "C-c C-b C-b") 'kill-other-buffers)

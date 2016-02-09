(add-hook 'view-mode-hook
          '(lambda()
             (progn
               (setq view-read-only t)
               (define-key view-mode-map "h" 'backward-char)
               (define-key view-mode-map "l" 'forward-char)
               (define-key view-mode-map "j" 'next-line)
               (define-key view-mode-map "k" 'previous-line)
               )))

;; 書き込み不能なファイルはview-modeで開くように
(defadvice find-file
    (around find-file-switch-to-view-file (file &optional wild) activate)
  (if (and (not (file-writable-p file))
           (not (file-directory-p file)))
      (view-file file)
    ad-do-it))
;; 書き込み不能な場合はview-modeを抜けないように
(defvar view-mode-force-exit nil)
(defmacro do-not-exit-view-mode-unless-writable-advice (f)
  `(defadvice ,f (around do-not-exit-view-mode-unless-writable activate)
     (if (and (buffer-file-name)
              (not view-mode-force-exit)
              (not (file-writable-p (buffer-file-name))))
         (message "File is unwritable, so stay in view-mode.")
       ad-do-it)))

(do-not-exit-view-mode-unless-writable-advice view-mode-exit)
(do-not-exit-view-mode-unless-writable-advice view-mode-disable)

(setq view-read-only t)
(defvar pager-keybind
      `(
        ("h" . backward-char)
        ("l" . forward-char)
        ("j" . next-line)
        ("k" . previous-line)
        ("S-SPC" . scroll-down)
        (" " . scroll-up)
        ("@" . set-mark-command)
        ("a" . beginning-of-buffer)
        ("e" . end-of-buffer)
        ("f" . forward-word)
        ("b" . backward-word)
        ("]" . forward-word)
        ("[" . backward-word)
        ("}" . forward-paragraph)
        ("{" . backward-paragraph)
        ("n" . ,(lambda () (interactive) (scroll-up 1)))
        ("p" . ,(lambda () (interactive) (scroll-down 1)))
        ("N" . ,(lambda () (interactive) (scroll-up 10)))
        ("P" . ,(lambda () (interactive) (scroll-down 10)))
        ("c" . scroll-other-window-down)
        ("v" . scroll-other-window)
        ("(" . point-undo)
        (")" . point-redo)
        ("J" . jaunte)
        ))
(defun define-many-keys (keymap key-table &optional includes)
  (let (key cmd)
    (dolist (key-cmd key-table)
      (setq key (car key-cmd)
            cmd (cdr key-cmd))
      (if (or (not includes) (member key includes))
        (define-key keymap key cmd))))
  keymap)
 
(defun view-mode-hook0 ()
  (define-many-keys view-mode-map pager-keybind)
  (hl-line-mode 1)
  (define-key view-mode-map " " 'scroll-up))
(add-hook 'view-mode-hook 'view-mode-hook0)
 
;; 書き込み不能なファイルは view-mode で開くように
(defadvice find-file
  (around find-file-switch-to-view-file (file &optional wild) activate)
  (if (and (not (file-writable-p file))
           (not (file-directory-p file)))
      (view-file file)
    ad-do-it))
;; 書き込み不能な場合は view-mode を抜けないように
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
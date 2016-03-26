(defun toggle-indent()
  (interactive)
  (let ((tabs-mode indent-tabs-mode))
    (if tabs-mode
        (progn (setq indent-tabs-mode nil)
               (progn (save-excursion
                        (goto-char (point-min)) (replace-string "    "  "    ")))
               (message "インデントはスペースになりました。"))
        (progn (setq indent-tabs-mode t )
               (progn (save-excursion
                        (goto-char (point-min)) (replace-string "    "  "    ")))
               (message "インデントはタブになりました。")))))

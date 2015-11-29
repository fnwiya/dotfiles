;;; meigen.el --- echo meigen randomly

;;; Commentary:

;;; Code:

(require 'f)

(defun random-call-message()
  (interactive)
  (let* ((random-messages
          (split-string
           (f-read-text "~/.emacs.d/elisp/myElisp/meigen/meigen.txt") "\n"))
    (len (length random-messages)))
    (car (nthcdr (random len) random-messages))))

(add-hook 'emacs-startup-hook
      (lambda ()
        (message (random-call-message))
        t
        ))

(provide 'meigen)
;;; meigen.el ends here

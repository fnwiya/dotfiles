;;; find-fileでディレクトリが無ければ作る
(defun make-directory-unless-directory-exists ()
  (let (
         (d (file-name-directory buffer-file-name))
       )
    (unless (file-directory-p d)
      (when (y-or-n-p "No such directory: make directory?")
        (make-directory d t))
      )
    )
  nil
)
(add-hook 'find-file-not-found-hooks
          'make-directory-unless-directory-exists)

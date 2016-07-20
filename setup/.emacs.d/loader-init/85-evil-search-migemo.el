(cond
 ((or (eq window-system 'ns) (eq window-system 'mac))
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict") ; your installed path
  )
 ((eq system-type 'gnu/linux)
  (setq ubuntu_dict_path "/usr/share/cmigemo/utf-8/migemo-dict")
  (if (file-exists-p ubuntu_dict_path)
  (setq migemo-dictionary ubuntu_dict_path))
  ))
(defun evil-search-function (&optional forward regexp-p wrap)
  "Return a search function.
If FORWARD is nil, search backward, otherwise forward.
If REGEXP-P is non-nil, the input is a regular expression.
If WRAP is non-nil, the search wraps around the top or bottom
of the buffer."
  `(lambda (string &optional bound noerror count)
     (let ((start (point))
           (search-fun ',(if regexp-p
                             (if forward
                                 're-search-forward
                               're-search-backward)
                           (if forward
                               'migemo-forward
                             'migemo-backward)))
           result)
       (setq result (funcall search-fun string bound
                             ,(if wrap t 'noerror) count))
       (when (and ,wrap (null result))
         (goto-char ,(if forward '(point-min) '(point-max)))
         (unwind-protect
             (setq result (funcall search-fun string bound noerror count))
           (unless result
             (goto-char start))))
       result)))

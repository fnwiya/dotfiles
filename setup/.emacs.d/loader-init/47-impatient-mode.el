(use-package impatient-mode
  :diminish impatient-mode
  :commands (impatient-mode)
  :init
  (add-hook 'web-mode-hook 'impatient-mode)
  (add-hook 'html-mode-hook 'impatient-mode)
  (add-hook 'Javascript-IDE-mode-hook 'impatient-mode)
  (add-hook 'markdown-mode-hook 'impatient-mode)
  :config
  (defun my-html-mode-hook ()
    "Starts the `simple-httpd' server if it is not already running, and turns
  on `impatient-mode' for the current buffer."
    (unless (get-process "httpd")
      (message "starting httpd server...")
      (httpd-start))
    (impatient-mode))
  (add-hook #'html-mode-hook #'my-html-mode-hook)
  (add-hook #'web-mode-hook #'my-html-mode-hook)
  (add-hook #'Javascript-IDE-mode-hook #'my-html-mode-hook)
  (add-hook #'markdown-mode-hook #'my-html-mode-hook)
  (defun open-imp-preview()
    (interactive)
    (browse-url "http://localhost:8080/imp/"))
  (global-set-key (kbd "C-x C-v") 'open-imp-preview)
  ;; Markdown
  ;; M-x imp-set-user-filter->markdown-html
  (defun markdown-html (buffer)
    (princ (with-current-buffer buffer
             (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
           (current-buffer)))
  (defun markdown-filter (buffer)
    (princ
     (with-temp-buffer
       (let ((tmpname (buffer-name)))
         (set-buffer buffer)
         (set-buffer (markdown tmpname)) ; the function markdown is in `markdown-mode.el'
         (buffer-string)))
     (current-buffer))))

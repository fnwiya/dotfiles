(use-package simple-httpd)

(use-package impatient-mode
  :commands (impatient-mode)
  :init
  (loop for hook in *programing-hooks*
        do (add-hook hook 'impatient-mode))
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
  (defun open-imp-preview()
    (interactive)
    (browse-url "http://localhost:8080/imp/")
    )
  (global-set-key (kbd "C-x C-v") 'open-imp-preview)
)

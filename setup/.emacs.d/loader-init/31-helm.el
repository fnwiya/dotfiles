(use-package helm-config
  :diminish helm-mode
  :config
  (helm-mode 1)
  (setq helm-buffers-fuzzy-matching t)
  (custom-set-variables '(helm-ff-auto-update-initial-value nil))
  (define-key global-map (kbd "M-x")     'helm-M-x)
  (define-key global-map (kbd "C-x C-x") 'helm-M-x)
  (define-key global-map (kbd "C-x C-f") 'helm-find-files)
  (define-key global-map (kbd "C-x C-w") 'write-file)
  (define-key global-map (kbd "C-x C-r") 'helm-recentf)
  (define-key global-map (kbd "C-x C-y") 'helm-show-kill-ring)
  (define-key global-map (kbd "M-y")     'helm-show-kill-ring)
  (define-key global-map (kbd "C-x C-b") 'helm-buffers-list)
  (define-key global-map (kbd "C-x b")   'helm-buffers-list)
  (define-key global-map (kbd "C-x C-k") 'kill-buffer)
  (define-key global-map (kbd "C-x k")   'kill-buffer)
  (define-key helm-map            (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-read-file-map  (kbd "TAB") 'helm-execute-persistent-action)
  ;; helmを有効にしない操作をリストに追加していく
  ;; (add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))
  ;; (add-to-list 'helm-completing-read-handlers-alist '(write-file . nil))
  )

(use-package helm-projectile)
(use-package helm-ghq)
(use-package helm-gtags)
(defun helm-my-buffers ()
  (interactive)
  (let ((helm-ff-transformer-show-only-basename nil))
	(helm-other-buffer '(helm-source-buffers-list
						 helm-source-projectile-files-list
						 helm-source-recentf
						 helm-source-locate
						 helm-source-ghq)
					   "*helm-my-buffers*")))
(define-key global-map (kbd "C-x m")   'helm-my-buffers)

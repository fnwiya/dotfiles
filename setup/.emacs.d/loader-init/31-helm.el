(require 'helm-config)
(require 'helm-projectile)
(helm-mode 1)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
(setq helm-buffers-fuzzy-matching t)

(global-set-key (kbd "M-x")     'helm-M-x)
(global-set-key (kbd "C-x C-x") 'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "C-x C-y") 'helm-show-kill-ring)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(define-key global-map (kbd "C-x C-b") 'helm-buffers-list)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)
(define-key global-map (kbd "C-x C-k") 'kill-buffer)
(define-key global-map (kbd "C-x k")   'kill-buffer)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map  (kbd "TAB") 'helm-execute-persistent-action)

(defun helm-my-buffers ()
  (interactive)
  (let ((helm-ff-transformer-show-only-basename nil))
	(helm-other-buffer '(helm-c-source-buffers-list
						 helm-c-source-elscreen
						 helm-c-source-projectile-files-list
						 helm-c-source-ctags
						 helm-c-source-recentf
						 helm-c-source-locate)
					   "*helm-my-buffers*")))

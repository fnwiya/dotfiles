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
  (advice-add 'helm-ff-filter-candidate-one-by-one
              :around (lambda (fcn file)
                        (unless (string-match "\\(?:/\\|\\`\\)\\.\\{1,2\\}\\'" file)
                          (funcall fcn file))))
  )

(use-package helm-projectile)

(use-package helm-swoop
  :config
  (global-set-key (kbd "M-i") 'helm-swoop)
  (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
  (global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
  (global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)
  (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
  (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
  (setq helm-multi-swoop-edit-save t)
  (setq helm-swoop-split-with-multiple-windows nil) ; tの場合はウィンドウ内に分割、nilなら別のウィンドウを使用
  (setq helm-swoop-split-direction 'split-window-vertically) ; ウィンドウ分割方向 'split-window-vertically or 'split-window-horizontally
  )

(use-package helm-ag)

(use-package helm-ghq)

(use-package helm-gtags
  :config
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (setq
   helm-gtags-ignore-case t
   helm-gtags-auto-update t
   helm-gtags-use-input-at-cursor t
   helm-gtags-pulse-at-cursor t
   helm-gtags-prefix-key "\C-cg"
   helm-gtags-suggested-key-mapping t
   )
  (define-key helm-gtags-mode-map (kbd "C-x C-g") nil)
  (define-key helm-gtags-mode-map (kbd "C-x C-g f") 'helm-gtags-tags-in-this-function)
  (define-key helm-gtags-mode-map (kbd "C-x C-g s") 'helm-gtags-select)
  (define-key helm-gtags-mode-map (kbd "C-x C-g d") 'helm-gtags-dwim)
  (define-key helm-gtags-mode-map (kbd "C-x C-g p") 'helm-gtags-pop-stack)
  (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
  (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
  )

(use-package helm-make
  :config
  (eval-after-load 'makefile-mode
    '(define-key makefile-mode-map (kbd "M-\"") 'helm-make-projectile))
  (eval-after-load 'c++-mode
    '(define-key c++-mode-map (kbd "M-\"") 'helm-make-projectile)))

;; http://rubikitch.com/2016/08/09/helm-swoop-helm-occur/
;;; migemoなしでhelm-swoop
(cl-defun helm-swoop-nomigemo (&key $query ($multiline current-prefix-arg))
  (interactive)
  (let (helm-migemo-mode)
    (helm-swoop :$query $query :$multiline $multiline)))

(defun isearch-forward-or-helm-swoop-or-helm-occur (use-helm-swoop)
  (interactive "p")
  (let (current-prefix-arg
        (helm-swoop-pre-input-function 'ignore))
    (call-interactively
     (case use-helm-swoop
       (1 'isearch-forward)
       ;; C-u C-sを押した場合
       ;; 1000000以上のバッファサイズならばhelm-occur、
       ;; それ以下ならばhelm-swoop
       (4 (if (< 1000000 (buffer-size)) 'helm-occur 'helm-swoop))
       ;; C-u C-u C-sでmigemoなしのhelm-swoop
       (16 'helm-swoop-nomigemo)))))
(global-set-key (kbd "C-s") 'isearch-forward-or-helm-swoop-or-helm-occur)

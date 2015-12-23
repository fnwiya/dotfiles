;;; byte-compile
;; (defun compile-inits()
;;   "compile my init-files"
;;   (interactive)
;;   (byte-recompile-directory (expand-file-name "~/.emacs.d/loader-init") 0)
;;   (byte-recompile-directory (expand-file-name "~/.emacs.d/themes") 0)
;;   (byte-compile-file "~/.emacs.d/init.el")
;;   )
;; (save-window-excursion
;;   (compile-inits)
;; )
;; (add-hook 'after-save-hook
;;           (lambda ()
;;             (if (eq major-mode 'emacs-lisp-mode)
;;                 (save-excursion
;;                   (byte-compile-file buffer-file-name)))))
;; (add-hook 'kill-emacs-hook
;;           (lambda()
;;             (shell-command "rm -f ~/.emacs.d/init.elc")
;;             (shell-command "rm -f ~/.emacs.d/themes/*.elc")
;;             (shell-command "rm -f ~/.emacs.d/loader-init/*.elc")))

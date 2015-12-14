;; (setq gc-cons-threshold (* 128 1024 1024))
;; ;;; git-pull/push
;; (shell-command "git -C $HOME/dotfiles pull && git -C $HOME/dotfiles submodule update")
;; (add-hook 'kill-emacs-hook
;;           (lambda()
;;             (shell-command "git add --all ~/dotfiles/. && git commit -m 'update' && git push")))

;;; package-manager
(let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/package/")
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(package-initialize)

;; (eval-when-compile (require 'cl))

;; (defvar installing-package-list
;;   '(
;;     ace-link
;;     anzu
;;     auto-async-byte-compile
;;     auto-capitalize
;;     avy
;;     bind-key
;;     browse-kill-ring
;;     cider
;;     clojure-mode
;;     company
;;     codic
;;     corral
;;     cperl-mode
;;     dash
;;     easy-kill
;;     elpy
;;     el-get
;;     ess
;;     exec-path-from-shell
;;     expand-region
;;     f
;;     flx-ido
;;     flycheck
;;     flyspell
;;     gist
;;     google-c-style
;;     google-translate
;;     ;;helm
;;     ;;helm-flyspell
;;     ;;helm-projectile
;;     highlight-indentation
;;     highlight-symbol
;;     ido-ubiquitous
;;     ido-vertical-mode
;;     impatient-mode
;;     init-loader
;;     jabber
;;     jedi
;;     jquery-doc
;;     js2-mode
;;     key-combo
;;     magit
;;     markdown-mode
;;     mmm-mako
;;     mmm-mode
;;     multi-term
;;     multiple-cursors
;;     open-junk-file
;;     org
;;     popwin
;;     projectile
;;     python-mode
;;     quickrun
;;     rainbow-delimiters
;;     rainbow-mode
;;     recentf-ext
;;     redo+
;;     saveplace
;;     sequential-command
;;     simple-httpd
;;     smartrep
;;     smex
;;     smooth-scroll
;;     sql-indent
;;     sqlup-mode
;;     tabbar
;;     tern
;;     tern-auto-complete
;;     twittering-mode
;;     undo-tree
;;     undohist
;;     use-package
;;     web-mode
;;     wgrep
;;     yasnippet
;;     ))
;; (defun install-listed-pkg()
;;   (interactive)
;; (let ((not-installed (loop for x in installing-package-list
;;                            when (not (package-installed-p x))
;;                            collect x)))
;;   (when not-installed
;;     (package-refresh-contents)
;;     (dolist (pkg not-installed)
;;       (package-install pkg))))
;;   )
;; (install-listed-pkg)

;; (require 'use-package)

;; ;;; byte-compile
;; ;; (defun compile-inits()
;; ;;   "compile my init-files"
;; ;;   (interactive)
;; ;;   (byte-recompile-directory (expand-file-name "~/.emacs.d/loader-init") 0)
;; ;;   (byte-recompile-directory (expand-file-name "~/.emacs.d/themes") 0)
;; ;;   (byte-compile-file "~/.emacs.d/init.el")
;; ;;   )
;; ;; (save-window-excursion
;; ;;   (compile-inits)
;; ;; )
;; ;; (add-hook 'after-save-hook
;; ;;           (lambda ()
;; ;;             (if (eq major-mode 'emacs-lisp-mode)
;; ;;                 (save-excursion
;; ;;                   (byte-compile-file buffer-file-name)))))
;; ;; (add-hook 'kill-emacs-hook
;; ;;           (lambda()
;; ;;             (shell-command "rm -f ~/.emacs.d/init.elc")
;; ;;             (shell-command "rm -f ~/.emacs.d/themes/*.elc")
;; ;;             (shell-command "rm -f ~/.emacs.d/loader-init/*.elc")))

;; ;;; init
;; (use-package init-loader
;;   :config
;;   (setq init-loader-show-log-after-init 'error-only)
;;   (init-loader-load "~/.emacs.d/loader-init")
;;   (if (file-directory-p "~/Dropbox/config-file/.emacs.d/inits")
;;       (init-loader-load "~/Dropbox/config-file/.emacs.d/inits")
;;     nil)
;;   )

;; (defun my-load-init-file()
;;   "re-load init-files"
;;   (interactive)
;;   (load-file "~/.emacs.d/init.el")
;;   )
;; (global-set-key (kbd "C-x L") 'my-load-init-file)

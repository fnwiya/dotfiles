(let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))


(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/package/")
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(add-to-list 'load-path  "~/.emacs.d/elisp/el-get/el-get/")
(setq el-get-dir "~/.emacs.d/elisp/el-get/")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(el-get 'sync)

(require 'cl)

(defvar installing-package-list
  '(
    ac-slime
    ace-jump-mode
    ace-link
    ahg
    anzu
    auto-async-byte-compile
    auto-capitalize
    auto-complete
    bind-key
    c-eldoc
    cider
    clojure-mode
    codic
    corral
    dash
    easy-kill
    exec-path-from-shell
    expand-region
    flx-ido
    flycheck
    flyspell
    google-c-style
    google-translate
;;    helm
;;    helm-flyspell
;;    helm-projectile
    highlight-indentation
    highlight-symbol
    hydra
    ido-ubiquitous
    ido-vertical-mode
    impatient-mode
    init-loader
    jabber
    jquery-doc
    js2-mode
    magit
    markdown-mode
    multi-term
    multiple-cursors
    neotree
    open-junk-file
    popwin
    projectile
    python-mode
    quickrun
    rainbow-delimiters
    rainbow-mode
    recentf-ext
    saveplace
    sequential-command
    simple-httpd
    slime
    smartrep
    smex
    smooth-scroll
    sql-indent
    sqlup-mode
    tabbar
    tern
    tern-auto-complete
    twittering-mode
    undohist
    undo-tree
    use-package
    web-mode
    wgrep
    yasnippet
    ))
(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                                                        collect x)))
  (when not-installed
      (package-refresh-contents)
          (dolist (pkg not-installed)
                  (package-install pkg))))

;; Packages to install from el-get
(defvar my/el-get-packages
  '(
;    smartchr
    )
  "A list of packages to install from el-get at launch.")
(el-get 'sync my/el-get-packages)

(require 'use-package)
(require 'bind-key)

(use-package init-loader
  :config
  (setq init-loader-show-log-after-init 'error-only)
  (init-loader-load "~/.emacs.d/loader-init")
;  (init-loader-load "~/Dropbox/config-file/.emacs.d/inits")
)


;; (use-package auto-async-byte-compile
;;   :config
;;   (setq auto-async-byte-compile-exclude-files-regexp "/junk/")
;;   (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
;;   )

;;(byte-recompile-directory (expand-file-name "~/.emacs.d/loader-init") 0)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 1000)
 '(custom-safe-themes
   (quote
	("d6ad95addd1ddb4eafbd037c8f4d127c334e04e37c46fdc9f24dc329f7ae24e6" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
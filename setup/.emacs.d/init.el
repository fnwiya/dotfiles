;; GCのスレッドを増量して高速化
(setq gc-cons-threshold (* 128 1024 1024))

(let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/package/")
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(require 'cl)

(unless (file-directory-p "~/.emacs.d/elisp/package/")
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
    avy
    bind-key
    c-eldoc
    cider
    clojure-mode
    codic
    corral
    cperl-mode
    dash
    easy-kill
    elpy
    el-get
    ess
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
    jedi
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
    undo-tree
    undohist
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
)

(require 'use-package)
(require 'bind-key)

(use-package el-get
  :init
  (add-to-list 'load-path  "~/.emacs.d/elisp/el-get/el-get/")
  (setq el-get-dir "~/.emacs.d/elisp/el-get/")
  :config
  (el-get 'sync)
)

(unless (file-directory-p "~/.emacs.d/elisp/el-get/smartchr/")
  (defvar my/el-get-packages
    '(
      smartchr
      )
    "A list of packages to install from el-get at launch.")
  (el-get 'sync my/el-get-packages)
)



(use-package init-loader
  :config
  (init-loader-load "~/.emacs.d/loader-init")
  (if (file-directory-p "~/Dropbox/config-file/.emacs.d/inits")
      (init-loader-load "~/Dropbox/config-file/.emacs.d/inits")
      nil)
)

(defun my-load-init-file()
  "init.elを読み込む"
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-x l") 'my-load-init-file)

;;; 終了時バイトコンパイル
;(add-hook 'kill-emacs-query-functions
;          (lambda ()
;            (if (file-newer-than-file-p "~/.emacs.d/init.el" "~/.emacs.d/loader-init/init.elc")
;                (byte-compile-file "~/.emacs.d/init.el"))
;            (byte-recompile-directory "~/.emacs.d/loader-init" 0)
;            (byte-recompile-directory "~/.emacs.d/theme" 0)
;            ))

;(byte-recompile-directory (expand-file-name "~/.emacs.d/loader-init") 0)

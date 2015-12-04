(setq gc-cons-threshold (* 128 1024 1024))
(shell-command "git -C $HOME/dotfiles pull")
(add-hook 'kill-emacs-hook
          (lambda()
            (shell-command "git add --all ~/dotfiles/. && git commit -m 'update' && git push")))


(let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/package/")
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(eval-when-compile (require 'cl))

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
    company
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
    f
    flx-ido
    flycheck
    flyspell
    google-c-style
    google-translate
    ;;helm
    ;;helm-flyspell
    ;;helm-projectile
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
    key-combo
    magit
    markdown-mode
    mmm-mako
    mmm-mode
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
    redo+
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

(require 'use-package)

(defun compile-inits()
  "compile my init-files"
  (interactive)
  (byte-recompile-directory (expand-file-name "~/.emacs.d/loader-init") 0)
  (byte-recompile-directory (expand-file-name "~/.emacs.d/themes") 0)
  (byte-compile-file "~/.emacs.d/init.el")
  )

(add-hook 'after-save-hook (function (lambda ()
                                       (if (eq major-mode 'emacs-lisp-mode)
                                           (save-excursion
                                             (byte-compile-file buffer-file-name))))))

(use-package init-loader
  :config
  (setq init-loader-show-log-after-init 'error-only)
  (init-loader-load "~/.emacs.d/loader-init")
  (if (file-directory-p "~/Dropbox/config-file/.emacs.d/inits")
      (init-loader-load "~/Dropbox/config-file/.emacs.d/inits")
    nil)
  )

(defun my-load-init-file()
  "re-load init.el"
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-x l") 'my-load-init-file)

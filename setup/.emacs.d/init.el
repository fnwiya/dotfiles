(setq gc-cons-threshold (* 128 1024 1024))   ; 高速化のおまじない
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; git-dotfiles
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun git-dotfiles()
  (interactive)
  (save-window-excursion
    (shell-command "git -C $HOME/dotfiles pull && git -C $HOME/dotfiles submodule update"))
  (add-hook 'kill-emacs-hook
            (lambda()
              (shell-command "git add --all ~/dotfiles/. && git commit -m 'update' && git push")))
  )
(when (window-system)
  (git-dotfiles))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; package-manager
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/package/")
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(eval-when-compile (require 'cl))

(defvar installing-package-list
  '(
    ace-link
    ag
    alchemist
    anzu
    apache-mode
    auto-async-byte-compile
    auto-package-update
    avy
    bind-key
    browse-kill-ring
    c-eldoc
    cider
    clj-refactor
    clojure-mode
    color-theme-solarized
    company
    company-c-headers
    codic
    corral
    cperl-mode
    csv-mode
    dash
    dumb-jump
    easy-kill
    el-get
    elixir-mode
    eproject
    ess
    exec-path-from-shell
    expand-region
    evil
    evil-leader
    evil-matchit
    evil-numbers
    evil-surround
    f
    flx-ido
    flycheck
    flyspell
    function-args
    gist
    go-mode
    go-eldoc
    google-c-style
    google-this
    google-translate
    guide-key
    haskell-mode
    helm
    helm-ag
    helm-ghq
    helm-gtags
    helm-make
    helm-projectile
    helm-swoop
    highlight-symbol
    hlinum
    ht
    ido-ubiquitous
    ido-vertical-mode
    irony
    impatient-mode
    init-loader
    ivy
    jade-mode
    jdee
    jquery-doc
    json-mode
    js2-mode
    key-combo
    magit
    macrostep
    markdown-mode
    marshal
    material-theme
    migemo
    mmm-mako
    mmm-mode
    moz
    multi-term
    multiple-cursors
    neotree
    open-junk-file
    org
    org-pomodoro
    org-toodledo
    pdf-tools
    popwin
    projectile
    project-explorer
    python-mode
    quickrun
    rainbow-delimiters
    rainbow-mode
    recentf-ext
    ruby-block
    ruby-end
    saveplace
    sequential-command
    shell-pop
    simple-httpd
    slime
    smartrep
    smex
    smooth-scroll
    sql-indent
    sqlup-mode
    state
    sudo-edit
    swiper
    tabbar
    tern
    tern-auto-complete
    twittering-mode
    typescript-mode
    undo-tree
    undohist
    use-package
    vimrc-mode
    web-mode
    wgrep
    yaml-mode
    yasnippet
    ))
(defun install-listed-pkg()
  (interactive)
  (let ((not-installed (loop for x in installing-package-list
                             when (not (package-installed-p x))
                             collect x)))
    (when not-installed
      (package-refresh-contents)
      (dolist (pkg not-installed)
        (package-install pkg)))))
(when (window-system)
  (save-window-excursion
    (install-listed-pkg)))

(require 'use-package)

(when (window-system)
  (use-package auto-package-update
    :config
    (setq auto-package-update-delete-old-versions t)
    (setq apu--last-update-day-path "~/.emacs.d/cache/.last-package-update-day")
    (add-hook 'auto-package-update-before-hook
              (lambda () (message "I will update packages now")))
    (save-window-excursion
      (auto-package-update-now))
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package init-loader
  :config
  (setq init-loader-show-log-after-init 'error-only)
  (init-loader-load "~/.emacs.d/loader-init")
  (if (file-directory-p "~/Dropbox/config-file/.emacs.d/inits")
      (init-loader-load "~/Dropbox/config-file/.emacs.d/inits")
    nil))

(defun my-load-init-file()
  "re-load init-files"
  (interactive)
  (load-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-x L") 'my-load-init-file)

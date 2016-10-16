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
    ghc
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 1000)
 '(haskell-indent-after-keywords
   (quote
    (("where" 4 0)
     ("of" 4)
     ("do" 4)
     ("mdo" 4)
     ("rec" 4)
     ("in" 4 0)
     ("{" 4)
     "if" "then" "else" "let")))
 '(haskell-indent-offset 4)
 '(haskell-indent-spaces 4)
 '(helm-ff-auto-update-initial-value nil)
 '(irony-additional-clang-options (quote ("-std=c++11")))
 '(package-selected-packages
   (quote
    (ghc yaml-mode wgrep web-mode vimrc-mode use-package undohist typescript-mode twittering-mode tern-auto-complete tabbar sudo-edit state sqlup-mode sql-indent smooth-scroll smex smartrep slime shell-pop sequential-command ruby-end ruby-block recentf-ext rainbow-mode rainbow-delimiters quickrun python-mode project-explorer pdf-tools org-toodledo org-pomodoro open-junk-file neotree multi-term moz mmm-mako migemo material-theme markdown-mode magit key-combo json-mode js2-mode jquery-doc jdee jade-mode irony init-loader impatient-mode ido-vertical-mode ido-ubiquitous hlinum highlight-symbol helm-swoop helm-projectile helm-make helm-gtags helm-ghq helm-ag haskell-mode guide-key google-translate google-this google-c-style go-eldoc gist function-args flycheck flx-ido expand-region exec-path-from-shell evil-surround evil-numbers evil-matchit evil-leader ess eproject el-get easy-kill dumb-jump csv-mode corral company-c-headers color-theme-solarized codic clj-refactor c-eldoc browse-kill-ring auto-package-update auto-async-byte-compile apache-mode anzu alchemist ag ace-link)))
 '(shell-pop-shell-type
   (quote
    ("ansi-term" " *shell-pop-ansi-term*"
     (lambda nil
       (ansi-term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/zsh")
 '(shell-pop-universal-key "C-c C-p")
 '(shell-pop-window-position "bottom")
 '(shell-pop-window-size 30))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fa-face-hint ((t (:background "#3f3f3f" :foreground "#ffffff"))))
 '(fa-face-hint-bold ((t (:background "#3f3f3f" :weight bold))))
 '(fa-face-semi ((t (:background "#3f3f3f" :foreground "#ffffff" :weight bold))))
 '(fa-face-type ((t (:inherit (quote font-lock-type-face) :background "#3f3f3f"))))
 '(fa-face-type-bold ((t (:inherit (quote font-lock-type-face) :background "#999999" :bold t)))))

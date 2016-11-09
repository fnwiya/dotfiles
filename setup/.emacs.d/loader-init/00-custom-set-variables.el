;; insert automatically
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
    (memoize racer rust-mode yaml-mode wgrep web-mode vimrc-mode use-package undohist typescript-mode twittering-mode tern-auto-complete tabbar sudo-edit state sqlup-mode sql-indent smooth-scroll smex smartrep slime shell-pop sequential-command ruby-end ruby-block recentf-ext rainbow-mode rainbow-delimiters quickrun python-mode project-explorer pdf-tools org-toodledo org-pomodoro open-junk-file neotree multi-term moz mmm-mako migemo material-theme markdown-mode magit key-combo json-mode js2-mode jquery-doc jdee jade-mode irony init-loader impatient-mode ido-vertical-mode ido-ubiquitous hlinum highlight-symbol helm-swoop helm-projectile helm-make helm-gtags helm-ghq helm-ag guide-key google-translate google-this google-c-style go-eldoc gist ghc fzf function-args flycheck flx-ido expand-region exec-path-from-shell evil-surround evil-numbers evil-matchit evil-leader ess eproject el-get easy-kill dumb-jump csv-mode corral company-c-headers color-theme-solarized codic clj-refactor c-eldoc browse-kill-ring auto-package-update auto-async-byte-compile apache-mode anzu alchemist ag ace-link)))
 '(shell-pop-shell-type
   (quote
    ("ansi-term" " *shell-pop-ansi-term*"
     (lambda nil
       (ansi-term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/zsh")
 '(shell-pop-universal-key "C-c C-p")
 '(shell-pop-window-position "bottom")
 '(shell-pop-window-size 30)
 '(yas-trigger-key "C-i"))
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

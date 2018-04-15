(defvar system-name-simple
  (replace-regexp-in-string "\\..*\\'" "" (system-name))
  "The simple host name of the machine Emacs is running on, which is without domain information.")

(defvar *programing-hooks*
  '(c-mode-hook
    c-mode-common-hook
    c++-mode-hook
    clojure-mode-hook
    coffee-mode-hook
    cperl-mode-hook
    css-mode-hook
    emacs-lisp-mode-hook
    elisp-mode-hook
    haskell-mode-hook
    haskell-cabal-mode
    jade-mode-hook
    Javascript-IDE-mode-hook
    JDEE-mode-hook
    js-mode-hook
    js2-mode-hook
    lisp-mode-hook
    literate-haskell-mode
    nxml-mode-hook
    perl-mode-hook
    python-mode-hook
    racer-mode-hook
    ruby-mode-hook
    rust-mode-hook
    sh-mode-hook
    slime-mode-hook
    slime-repl-mode-hook
    sql-mode-hook
    typescript-mode-hook
    vimrc-mode-hook
    web-mode-hook
    yaml-mode-hook))

(defvar *txt-hooks*
  '(text-mode-hook
    org-mode-hook
    twittering-edit-mode-hook
    eww-mode-hook
    pdf-view-mode-hook))

(defvar *lisp-mode-hooks*
  '(lisp-mode-hook
    emacs-lisp-mode-hook
    lisp-interaction-mode-hook
    inferior-gauche-mode-hook
    scheme-mode-hook))

(defvar *cache-dir* "~/.emacs.d/cache")

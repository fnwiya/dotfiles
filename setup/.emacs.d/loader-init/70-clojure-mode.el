(use-package clojure-mode
  :mode
  (("\.clj$" . clojure-mode)))

(use-package cider
  :init
  (add-hook 'cider-mode-hook #'clj-refactor-mode)
  :config
  (setq nrepl-log-messages t
        cider-repl-display-in-current-window t
        cider-repl-use-clojure-font-lock t
        cider-prompt-save-file-on-load 'always-save
        cider-font-lock-dynamically '(macro core function var)
        cider-overlays-use-font-lock t)
  (cider-repl-toggle-pretty-printing))

(use-package clj-refactor
  :diminish clj-refactor-mode
  :config
  (cljr-add-keybindings-with-prefix "C-c j"))

(use-package guide-key
  :config
  (setq guide-key/popup-window-position 'bottom)
  (setq guide-key/guide-key-sequence '("C-x r" "C-c" "SPC" (org-mode "C-c C-x")))
  (setq guide-key/idle-delay 0.5)
  (setq guide-key/recursive-key-sequence-flag t)
  (setq guide-key/text-scale-amount -0.5)
  (setq guide-key/highlight-command-regexp
      '("rectangle"
        ("register" . font-lock-type-face)
        ("bookmark" . "hot pink")))
  (guide-key-mode 1))

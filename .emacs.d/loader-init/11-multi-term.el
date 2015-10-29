(use-package multi-term
  :commands
  (multi-term)
  :config
  (setq multi-term-program shell-file-name)

  (setenv "TERMINFO" "~/.terminfo")

  (add-hook 'term-mode-hook
            '(lambda ()
               (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
               (define-key term-raw-map (kbd "C-y") 'term-paste)
               (setq next-screen-context-lines 0)
               ))

  (global-set-key (kbd "C-c m") '(lambda ()
                                   (interactive)
                                   (multi-term)))

  (defadvice linum-on(around my-linum-term-on() activate)
  (unless (eq major-mode 'term-mode) ad-do-it))

  ;; emacs に認識させたいキー
  (add-to-list 'term-unbind-key-list "C-t")
  (add-to-list 'term-unbind-key-list '"M-x")
)

;; ESC2回でtermのESC1回分、vimから抜ける。
(add-hook 'term-mode-hook
     (lambda ()
        (define-key term-raw-map (kbd "ESC ESC")
          (lambda ()
            "ESCを渡す"
            (interactive)
            (term-send-raw-string "e")))
        ))

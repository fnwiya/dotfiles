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
               (define-key term-raw-map (kbd "C-r") 'term-send-raw)
               (define-key term-raw-map (kbd "C-,") 'term-send-raw)
               (setq next-screen-context-lines 0)
               ))
  (defadvice linum-on(around my-linum-term-on() activate)
  (unless (eq major-mode 'term-mode) ad-do-it))
  ;; emacs に認識させたいキー
  (add-to-list 'term-unbind-key-list "C-t")
  (add-to-list 'term-unbind-key-list "M-x")
  (add-to-list 'term-unbind-key-list "C-f")
  (add-to-list 'term-unbind-key-list "C-b")
)

;; ESC2回でtermのESC1回分、vimから抜ける。
(add-hook 'term-mode-hook
     (lambda ()
        (define-key term-raw-map (kbd "ESC ESC")
          (lambda ()
            (interactive)
            (term-send-raw)))
        ))

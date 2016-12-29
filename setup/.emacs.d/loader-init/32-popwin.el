(use-package popwin
  :config
  (setq helm-samewindow nil)
  (setq display-buffer-function 'popwin:display-buffer)
  (setq popwin:popup-window-position 'bottom)
  (setq popwin:special-display-config '(("*compilation*" :noselect t)
                                        ("helm" :regexp t :height 20)
                                        ))

  (push '("*Shell Command Output*") popwin:special-display-config)
  (push '("*compilation*" :height 20 :noselect t :stick t) popwin:special-display-config)
  (push '("*magit-edit-log*" :height 20) popwin:special-display-config)
  (push '("*magit-diff*" :height 20) popwin:special-display-config)
  (push '("*Help*" :height 20) popwin:special-display-config)
  (push '("*Backtrace*" :height 20) popwin:special-display-config)
  (push '("*Warnings*" :height 20) popwin:special-display-config)
  (push '("*twittering-edit*" :height 20 :regexp t) popwin:special-display-config)
  (push '("*grep*" :height 20) popwin:special-display-config)
  (push '("*Google Translate*" :height 20) popwin:special-display-config)
  (push '("*Compile-Log*" :height 20 :noselect t) popwin:special-display-config)
  (push '("*auto-async-byte-compile*" :height 20) popwin:special-display-config)
  (push '("*terminal<2>*" :height 20) popwin:special-display-config)
  (push '("*Async Shell Command*") popwin:special-display-config)
  (push '("*Kill Ring*") popwin:special-display-config)
  (push '("*popwin-dummy*") popwin:special-display-config)
  (push '("*SQL*") popwin:special-display-config)
  ;; slime
  (push '("*slime-apropos*") popwin:special-display-config)
  (push '("*slime-macroexpansion*") popwin:special-display-config)
  (push '("*slime-description*") popwin:special-display-config)
  (push '("*slime-compilation*" :noselect t) popwin:special-display-config)
  (push '("*slime-xref*") popwin:special-display-config)
  (push '("*slime-repl sbcl") popwin:special-display-config)
  (push '(sldb-mode :stick t) popwin:special-display-config)
  (push '(slime-repl-mode) popwin:special-display-config)
  (push '(slime-connection-list-mode) popwin:special-display-config)
  )
(when (featurep 'popwin)
  (push '("*eshell*" :height 0.5) popwin:special-display-config)

  (defun eshell-pop (universal-argument)
    "open eshell window using popwin-elf"
    (interactive "P")
    (let* ((eshell-buffer-name "*eshell*")
       (eshell-buffer (get-buffer eshell-buffer-name))
       (file-name (buffer-file-name (current-buffer)))
       (current-directory (with-current-buffer (current-buffer) default-directory)))
      (if eshell-buffer
      (popwin:display-buffer eshell-buffer)
    (eshell))
      (when (and universal-argument file-name)
    (eshell-kill-input)
    (insert (concat "cd " current-directory))
    (eshell-send-input)
    (end-of-buffer)))))

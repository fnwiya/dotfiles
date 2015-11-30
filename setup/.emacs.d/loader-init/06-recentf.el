(use-package recentf
  :commands
  (recentf-open-files)
  :config
  (setq recentf-save-file "~/.emacs.d/cache/.recentf")
  (setq recentf-max-saved-items 1000)
  (setq recentf-exclude '(".recentf" "~/.emacs.d/cache/ido.last"))
  (setq recentf-auto-cleanup 30)
  (setq recentf-auto-save-timer
        (run-with-idle-timer 60 t 'recentf-save-list))
  (recentf-mode 1)
  )

(autoload 'recentf-ext "recentf-ext" nil t) 

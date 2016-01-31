(when window-system
   (setq custom-theme-directory "~/.emacs.d/themes/")
   ;; (load-theme 'fnwiya t)
   ;; (enable-theme 'fnwiya)
   (load-theme 'solarized-dark t)
  )
(unless window-system
)

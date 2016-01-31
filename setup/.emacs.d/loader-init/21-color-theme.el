(when window-system
   (setq custom-theme-directory "~/.emacs.d/themes/")
   (load-theme 'fnwiya t)
   (enable-theme 'fnwiya)
   (load-theme 'material t)
   (load-theme 'solarized-dark t)
   (load-theme 'spolsky t)
   (load-theme 'odersky t)
   (load-theme 'hickey t)
   (load-theme 'brin t)
  )
(unless window-system
)

(when window-system
  (setq custom-theme-directory "~/.emacs.d/themes/")
  (load-theme 'fnwiya t)
  (enable-theme 'fnwiya)
)
(unless window-system
)

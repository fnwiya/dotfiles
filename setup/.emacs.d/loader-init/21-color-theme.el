(when (window-system)
  (setq custom-theme-directory "~/.emacs.d/themes/")
  (load-theme 'fnwiya t)
  (enable-theme 'fnwiya))
(unless (window-system)
  (use-package solarized
    :config
    (set-frame-parameter nil 'background-mode 'dark)
    (set-terminal-parameter nil 'background-mode 'dark)
    (enable-theme 'solarized)))

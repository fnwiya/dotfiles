(when window-system
  (setq custom-theme-directory "~/.emacs.d/themes/")
  (load-theme 'fnwiya t)
  (enable-theme 'fnwiya)
  ;; (setq solarized-distinct-fringe-background t)
  ;; (setq solarized-use-less-bold t)
  ;; (setq solarized-use-more-italic t)
  ;; ;; フォントサイズを変更しない
  ;; (setq solarized-height-minus-1 1)
  ;; (setq solarized-height-plus-1 1)
  ;; (setq solarized-height-plus-2 1)
  ;; (setq solarized-height-plus-3 1)
  ;; (setq solarized-height-plus-4 1)
  ;; (load-theme 'solarized-dark t)
  )
(unless window-system
  )

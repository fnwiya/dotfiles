(use-package web-mode
  :mode
  (("\\.html?\\'" . web-mode)
   ("\\.php\\'" . web-mode)
   ("\\.hbs\\'" . web-mode)
   ("\\.jsp\\'" . web-mode)
   ("\\.fsp\\'" . web-mode)
   ("\\.gsp\\'" . web-mode))
  :config
  ;; web-modeの設定
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  )

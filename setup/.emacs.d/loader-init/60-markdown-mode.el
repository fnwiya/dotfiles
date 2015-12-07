(use-package markdown-mode
  :mode
  (("\.md$" . markdown-mode)
   ("\.markdown$" . markdown-mode))
  :config
  (bind-key "C-x C-s" 'save-buffer markdown-mode-map)
 )

(use-package google-this
  ;; search at point: C-c / g
  :config
  (google-this-mode 1)
  (global-set-key (kbd "C-x g") 'google-this-mode-submap))

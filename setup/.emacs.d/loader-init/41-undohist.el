(use-package undohist
  :init
  (setq undohist-directory "~/.emacs.d/cache/undohist")
  :commands
  (undo)
  :config
  (undohist-initialize)
  )

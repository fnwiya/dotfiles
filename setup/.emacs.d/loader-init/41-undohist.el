(use-package undohist
  :init
  (setq undohist-directory "~/.emacs.d/cache/undohist")
  :config
  (undohist-initialize)
  (setq undohist-ignored-files '("/tmp" "/EDITMSG" "/elpa")))

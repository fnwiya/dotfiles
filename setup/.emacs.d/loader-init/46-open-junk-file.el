(use-package open-junk-file
  :bind
  (("C-x j" . open-junk-file)
   ("C-x C-j" . open-junk-file))
  :config
  (setq open-junk-file-format "~/.emacs.d/cache/junk/%Y-%m-%d-%H%M%S.")
  (setq open-junk-file-find-file-function 'find-file)) ; 別ウィンドウではなく現在のウィンドウに開く

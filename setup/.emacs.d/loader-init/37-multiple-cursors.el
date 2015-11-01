(use-package multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("M-R" . mc/mark-all-dwim))
  :config
  (setq mc/list-file "~/.emacs.d/cache/mc-lists.el")
)

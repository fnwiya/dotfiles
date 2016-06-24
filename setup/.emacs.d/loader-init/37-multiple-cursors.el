(use-package multiple-cursors
  :diminish multiple-cursors-mode
  :commands (multiple-cursors-mode)
  :init
  (loop for hook in *programing-hooks*
        do (add-hook hook 'multiple-cursors-mode))
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("M-R" . mc/mark-all-dwim))
  :config
  (setq mc/list-file "~/.emacs.d/cache/mc-lists.el")
)

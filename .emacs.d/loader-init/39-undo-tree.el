;; undo-tree C-x u->d/C-p/C-f/C-n
(use-package undo-tree
  :bind
  (("C-x u"  . undo-tree-visualize))
  :config
  (global-undo-tree-mode t)
  (bind-key (kbd "C-/") 'undo-tree-redo)
)

(use-package dumb-jump
  :commands
  (dumb-jump-mode)
  :init
  (loop for hook in *programing-hooks*
        do (add-hook hook 'dumb-jump-mode)))

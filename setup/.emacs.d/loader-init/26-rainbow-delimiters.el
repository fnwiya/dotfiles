(use-package rainbow-delimiters
  :diminish rainbow-delimiters-mode
  :commands (rainbow-delimiters-mode)
  :init
  (loop for hook in *programing-hooks*
        do (add-hook hook 'rainbow-delimiters-mode))
  :config
  )

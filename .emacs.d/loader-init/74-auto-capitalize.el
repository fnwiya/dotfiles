(use-package auto-capitalize
  :commands (turn-on-auto-capitalize-mode)
  :init
  (loop for hook in *txt-hooks*
        do (add-hook hook 'turn-on-auto-capitalize-mode))
  :config
  )

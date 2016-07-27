(use-package flycheck-mode
  :commands (flycheck-mode)
  :init
  (loop for hook in *programing-hooks*
        do (add-hook hook 'flycheck-mode))
  :config
  (global-flycheck-mode)
  '(custom-set-variables
    '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs))
   )
)

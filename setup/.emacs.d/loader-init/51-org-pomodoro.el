(use-package org-pomodoro
  :config
    (add-hook 'org-pomodoro-finished-hook
            (lambda()
              (switch-to-buffer))))

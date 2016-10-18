(use-package org-pomodoro
  :config
  (add-hook 'org-pomodoro-finished-hook
            (lambda()
              (shell-command "notify-send \"pomodoro finished\""))))

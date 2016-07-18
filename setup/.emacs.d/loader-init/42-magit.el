(use-package magit
  :if (executable-find "git")
  :commands magit-status
  :config
  )
(add-to-list 'auto-mode-alist '("COMMIT_EDITING" . git-commit-mode))

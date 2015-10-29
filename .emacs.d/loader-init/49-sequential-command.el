(use-package sequential-command-config
  :bind
  (("C-a" . seq-home)
   ("C-e" . seq-end))
  :config
  (sequential-command-setup-keys)
  )

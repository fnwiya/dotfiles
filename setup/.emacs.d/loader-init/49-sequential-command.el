(use-package sequential-command-config
  :config
  (sequential-command-setup-keys)
  (bind-key "C-a" 'seq-home)
  (bind-key "C-e" 'seq-end)
  )

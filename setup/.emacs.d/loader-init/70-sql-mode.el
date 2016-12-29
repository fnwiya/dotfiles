(use-package sql
  :mode
  (("\.sql$" . sql-mode)
   ("\.sqltmpl$" . sql-mode))
  :config
  (setq sql-indent-offset 4)
  (sql-set-product "postgres")
  )
(use-package sqlup-mode
  :commands (sqlup-mode)
  :init
  (add-hook 'sql-mode-hook 'sqlup-mode)
  (add-hook 'sql-interactive-mode-hook 'sqlup-mode)
  :config
  )

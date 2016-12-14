(use-package org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.org_archive$" . org-mode))
;; (setq org-default-notes-file "~/Dropbox/backup/memo.org")
(setq org-agenda-files (list org-default-notes-file ))
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(d)" "WAIT(w)" "RESCHEDULE(r)" "|" "DONE(d)" "CANCEL(c)")))
(setq org-log-done 'time)

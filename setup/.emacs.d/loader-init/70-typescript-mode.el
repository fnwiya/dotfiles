(use-package typescript-mode
  :mode
  (("\\.ts\\'" . typescript-mode)))
(use-package tss
  :config
  (setq tss-popup-help-key "C-:")
  (setq tss-jump-to-definition-key "C->")
  (setq tss-implement-definition-key "C-c i"))

(defun typescript-setup ()
  (setq typescript-indent-level 2)
  (flycheck-mode t)
  (flycheck-typescript-tslint-setup)
  (tss-setup-current-buffer))

(add-hook 'typescript-mode-hook 'typescript-setup)
(add-hook 'kill-buffer-hook 'tss - delete-process t)

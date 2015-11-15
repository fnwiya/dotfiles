(use-package ido
  :bind
  (("C-x C-r" . ido-recentf-open)
   ("C-x C-f" . ido-find-file)
   ("C-x C-d" . ido-dired)
   ("C-x k" . ido-kill-buffer)
   ("C-x C-k" . ido-kill-buffer)
   ("C-x b" . ido-switch-buffer)
   ("C-x C-b" . ido-switch-buffer)
   ("M-x" . smex))
  :init
  (defun ido-recentf-open ()
    "Use `ido-completing-read' to \\[find-file] a recent file"
    (interactive)
    (if (find-file (ido-completing-read "Find recent file: " recentf-list))
        (message "Opening file...")
      (message "Aborting")))
  :config
  (ido-mode 1)
  (ido-ubiquitous-mode 1)
  (flx-ido-mode 1)
  (ido-everywhere)
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil)
  (setq ido-create-new-buffer 'always)
  (setq ido-use-filename-at-point 'guess)
  (setq ido-save-directory-list-file "~/.emacs.d/cache/ido.last")
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)
  (setq ido-vertical-show-count t)
  (setq ido-max-window-height 0.75)
)
(use-package smex
  :bind
  (("M-x" . smex)
   ("M-X" . smex-major-mode-commands))
  :init
  (setq smex-save-file "~/.emacs.d/cache/.smex-items")
  :config
  (smex-initialize)
  )

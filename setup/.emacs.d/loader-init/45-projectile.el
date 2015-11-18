(use-package projectile
  :commands (projectile-mode)
  :init
  (loop for hook in *programing-hooks*
        do (add-hook hook 'projectile-mode))
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'helm)
  (setq projectile-indexing-method 'native)
  (setq projectile-cache-file "~/.emacs.d/cache/projectile/projectile.cache")
  (setq projectile-known-projects-file "~/.emacs.d/cache/projectile/projectile-bookmarks.eld")
  )

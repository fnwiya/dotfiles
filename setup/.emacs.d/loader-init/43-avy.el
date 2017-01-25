(use-package avy
  :config
  (global-set-key (kbd "M-:") 'avy-goto-char)
  (global-set-key (kbd "C-:") 'avy-goto-word-0)
  )

(use-package avy-migemo
  :config
  (avy-migemo-mode 1)
  (require 'avy-migemo-e.g.swiper)
  )

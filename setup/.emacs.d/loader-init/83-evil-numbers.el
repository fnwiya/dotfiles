(use-package evil-numbers
  :config
  (define-key evil-normal-state-map (kbd "+") #'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "-") #'evil-numbers/dec-at-pt)
)

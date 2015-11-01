(use-package quickrun
  :bind
  (("<f5>" . quickrun))
  :config
  (push '("*quickrun*" :height 20) popwin:special-display-config)
)

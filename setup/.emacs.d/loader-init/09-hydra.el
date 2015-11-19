(add-hook 'after-init-hook (lambda()
  (use-package hydra-examples
    :config
    (global-set-key
      (kbd "C-M-s")
        (defhydra hydra-splitter (:color red)
          "splitter"
          ("h" hydra-move-splitter-left)
          ("j" hydra-move-splitter-down)
          ("k" hydra-move-splitter-up)
          ("l" hydra-move-splitter-right)))
  )
))

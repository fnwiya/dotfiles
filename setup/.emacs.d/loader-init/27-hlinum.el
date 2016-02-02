(use-package hlinum
  :diminish hlinum-mode
  :config
  (defadvice evil-set-cursor-color (after keu-hlinum activate)
    "Reflect cursor color change to `linum-highlight-face' for `hlinum'."
    (set-face-attribute 'linum-highlight-face nil
                        :background (ad-get-arg 0)))
  ;; (custom-set-faces
  ;;    '(linum-highlight-face ((t (:foreground "black"
  ;;                                            :background "red")))))
  (hlinum-activate))

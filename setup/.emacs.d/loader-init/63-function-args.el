(use-package function-args
  :config
  (fa-config-default)
  (custom-set-faces
   '(fa-face-hint ((t (:background "#3f3f3f" :foreground "#ffffff"))))
   '(fa-face-hint-bold ((t (:background "#3f3f3f" :weight bold))))
   '(fa-face-semi ((t (:background "#3f3f3f" :foreground "#ffffff" :weight bold))))
   '(fa-face-type ((t (:inherit (quote font-lock-type-face) :background "#3f3f3f"))))
   '(fa-face-type-bold ((t (:inherit (quote font-lock-type-face) :background "#999999" :bold t))))))
; fa-show M-i
; fa-jump M-j
; moo-complete M-o

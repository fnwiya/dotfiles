;; 1行づつスクロールする
(setq scroll-conservatively 1)
(setq scroll-step 1)
(setq scroll-margin 3)
(setq next-screen-context-lines 2)

;;; smooth-scroll
(use-package smooth-scroll
  :config
  (smooth-scroll-mode t)
  )

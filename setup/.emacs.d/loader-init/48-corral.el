(use-package corral
  :bind
  (("M-9" . corral-parentheses-backward)
   ("M-0" . corral-parentheses-forward)
   ("M-[" . corral-brackets-backward)
   ("M-]" . corral-brackets-forward)
   ("M-{" . corral-braces-backward)
   ("M-}" . corral-braces-forward)
   ("M-\"" . corral-double-quotes-backward))
  :config
  (setq corral-preserve-point t)
  (setq corral-syntax-entries '((?# "_")
                              (?* "_"))))

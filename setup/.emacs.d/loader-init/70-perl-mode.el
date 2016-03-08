(use-package cperl-mode
  :mode
  (("\.pl$" . cperl-mode))
  :interpreter
  (("perl" . cperl-mode)
   ("perl5" . cperl-mode)
   ("miniperl" . cperl-mode))
  :config
  (setq cperl-indent-level 4
        cperl-continued-statement-offset 4
        cperl-close-paren-offset -4
        cperl-label-offset -4
        cperl-comment-column 40
        cperl-highlight-variables-indiscriminately t
        cperl-indent-parens-as-block t
        cperl-tab-always-indent nil
        cperl-font-lock t))

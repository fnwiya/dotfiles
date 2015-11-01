
((digest . "212118fe49863c978fa80129e89ad847") (undo-list (773 . 774) nil ("
" . -773) ((marker . 773) . -1) ((marker . 773) . -1) ((marker . 773) . -1) ((marker . 773) . -1) ((marker . 773) . -1) nil ("(" . -774) ((marker . 773) . -1) ((marker) . -1) ((marker) . -1) nil (" " . -775) ((marker . 773) . -1) ((marker) . -1) ((marker) . -1) ((marker) . -1) nil (" " . -776) ((marker . 773) . -1) ((marker) . -1) ((marker) . -1) ((marker) . -1) nil (")" . -777) ((marker . 773) . -1) ((marker) . -1) ((marker) . -1) ((marker) . -1) ((marker* . 772) . 1) ((marker . 773) . -1) nil (774 . 778) (t 22055 20712 0 0) nil ("
" . -774) ((marker . 773) . -1) ((marker) . -1) ((marker) . -1) ((marker) . -1) ((marker) . -1) ((marker) . -1) ((marker) . -1) ((marker . 773) . -1) ((marker . 773) . -1) ((marker . 773) . -1) nil (";; 括弧の自動補完
(use-package smartparens-config
  :commands (smartparens-mode)
  :init
  (loop for hook in *programing-hooks*
        do (add-hook hook 'smartparens-mode))
  :config
  (smartparens-global-mode t)
)
" . 775) ((marker . 773) . -209) ((marker) . -24) ((marker) . -42) ((marker) . -208) ((marker) . -209) ((marker) . -207) ((marker) . -208) ((marker) . -209) 984 (t 22053 10291 0 0) nil (" " . -281) nil (" " . -282) (t 22051 39774 0 0)))

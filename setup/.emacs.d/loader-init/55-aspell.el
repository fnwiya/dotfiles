(use-package flyspell
  :commands
  (flyspell-mode)
  :init
  (loop for hook in *txt-hooks*
        do (add-hook hook 'flyspell-mode))
  :config
  ;; asplellの導入 http://qiita.com/catatsuy/items/ae9875706769d4f02317
  (cond ((or (eq window-system 'ns) (eq window-system 'mac)))
    (setq-default ispell-program-name "aspell")
    (eval-after-load "ispell"
     '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
    (setq-default ispell-program-name "/usr/local/bin/aspell"))
  )

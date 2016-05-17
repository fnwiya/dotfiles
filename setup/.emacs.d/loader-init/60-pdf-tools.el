(use-package pdf-tools
  ;;https://github.com/politza/pdf-tools
  ;;(pdf-tools-install)
  :config
  (add-to-list 'auto-mode-alist '("\.pdf$" . pdf-view-mode))
  )

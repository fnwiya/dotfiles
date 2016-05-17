(use-package pdf-tools
  ;;https://github.com/politza/pdf-tools
  ;;(pdf-tools-install)
  (add-hook 'pdf-view-mode-hook
   '(lambda ()
      (pdf-view-mode)
      ))
  )

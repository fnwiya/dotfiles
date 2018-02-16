(use-package moz
  :config
  ;; (add-hook 'js2-mode-hook 'js2-moz-setup)
  ;; (defun js2-moz-setup ()
  ;;   (moz-minor-mode 1))

  ;; (add-hook 'web-mode-hook 'web-moz-setup)
  ;; (defun web-moz-setup ()
  ;;   (moz-minor-mode 1))

  ;; (add-hook 'css-mode-hook 'css-moz-setup)
  ;; (defun css-moz-setup ()
  ;;   (moz-minor-mode 1))

  (defun moz-send-reload ()
    (interactive)
    (comint-send-string (inferior-moz-process)
                        (concat moz-repl-name ".pushenv('printPrompt', 'inputMode'); "
                                moz-repl-name ".setenv('inputMode', 'line'); "
                                moz-repl-name ".setenv('printPrompt', false); undefined; "))
    (comint-send-string (inferior-moz-process)
                        (concat "content.location.reload();\n"
                                moz-repl-name ".popenv('inputMode', 'printPrompt'); undefined;\n"))
    ))

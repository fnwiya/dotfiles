(use-package smartchr
  :defer t
  :commands (smartchr)
  :config
  (global-set-key (kbd "=") (smartchr '(" = " " == " "=" " === ")))
  (global-set-key (kbd "+") (smartchr '(" + " "+" " += " "++")))
  (global-set-key (kbd "-") (smartchr '("-" " - " " -= " "--")))
  (global-set-key (kbd "-") (smartchr '(" * " "*" " *= ")))
  (global-set-key (kbd "-") (smartchr '(" / " "/" " /= ")))
  (global-set-key (kbd "-") (smartchr '("%" " % " " %= ")))
  (global-set-key (kbd "!") (smartchr '("!" " != ")))
  (global-set-key (kbd "&") (smartchr '(" && " "&")))
  (global-set-key (kbd "|") (smartchr '(" || " "|")))
  (global-set-key (kbd "?") (smartchr '(" ? " "?")))
  (global-set-key (kbd ":") (smartchr '(": " ":" " : ")))
  (global-set-key (kbd "{") (smartchr '("{`!!'}" "{")))
  (global-set-key (kbd "(") (smartchr '("(`!!')" "(")))
  (global-set-key (kbd "<") (smartchr '(" < " "<`!!'>" "<"  " <= ")))
  (global-set-key (kbd ">") (smartchr '(" > " ">"  " >= ")))
  (global-set-key (kbd "[") (smartchr '("[`!!']" "[")))
  (global-set-key (kbd "\"") (smartchr '("\"`!!'\""  "\""  "\"\"\"`!!'\"\"\"")))
  (global-set-key (kbd "\'") (smartchr '("\'`!!'\'"  "\'")))
  (defun python-smartchr ()
    (local-set-key (kbd ":") (smartchr '(":" "::")))
  )
  (add-hook 'python-mode-hook 'python-smartchr)
  (defun lisp-smartchr ()
    (local-set-key (kbd "+") (smartchr '("+ " "+")))
    (local-set-key (kbd "-") (smartchr '("- " "-")))
    (local-set-key (kbd "*") (smartchr '("* " "*")))
    (local-set-key (kbd "\'") (smartchr '("\'" "\'`!!'\'")))
    (local-set-key (kbd "#") (smartchr '("#\'" "#")))
  )
  (add-hook 'lisp-mode-hook 'lisp-smartchr)
  (add-hook 'repl-mode-hook 'lisp-smartchr)
)

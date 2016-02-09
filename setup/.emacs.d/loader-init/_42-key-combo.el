(use-package key-combo
  :diminish key-combo-mode
  :config
  (global-key-combo-mode t)
  (setq key-combo-common-mode-hooks
        *programing-hooks*)
  (setq key-combo-common-default
    '(
      ("=" . (" = " " == " "=" " === "))
      ("+" . (" + " "+" " += " "++"))
      ("-" . ("-" " - " " -= " "--"))
      ("*" . (" * " "*" " *= "))
      ("/" . ("/" " / " " /= " "/* `!!' */" "//"))
      ("%" . ("%" " % " " %= "))
      ("!" . ("!" " != "))
      ("&" . (" && " "&"))
      ("|" . (" || " "|"))
      ("?" . (" ? " "?"))
      ("," . (", " "," ",\n"))
      ("{" . ("{\n`!!'\n}" "{" "{`!!'}" "{}"))
      ("(" . ("(`!!')" "(" "()"))
      ("[" . ("[`!!']" "[" "[]"))
      ("<" . (" < " "<`!!'>" "<"  " <= "))
      (">" . (" > " ">"  " >= "))
      ("\"" . ("\"`!!'\""  "\""  "\"\"\"`!!'\"\"\""))
      (";" . (";\n" ";"))
  ))
  (key-combo-define-hook key-combo-common-mode-hooks
                        'key-combo-common-load-default
                         key-combo-common-default)
  ;; python
  (setq key-combo-python-mode-hooks
        '(python-mode-hook))
  (setq key-combo-python-default
  '(
    ))
  (key-combo-define-hook key-combo-python-mode-hooks
                        'key-combo-python-load-default
                         key-combo-python-default)
  ;; lisp
  (setq key-combo-lisp-mode-hooks
      '(lisp-mode-hook
        emacs-lisp-mode-hook
        lisp-interaction-mode-hook
        inferior-gauche-mode-hook
        scheme-mode-hook))
  (setq key-combo-lisp-default
  '(
    ("+" . ("+ " "+"))
    ("-" . ("-" "- "))
    ("*" . ("* " "*"))
    ;; ("/" . ("/ " "/"))
    ("\'" . ("\'" "\'`!!'\'"))
    ("." . (" . " "."))
    ("," . (","))
    ("&" . ("&"))
    ("#" . ("#\'" "#"))
    ("=" . ("= " "="))
    ("<" . ("< " "<"))
    (">" . ("> " ">"))
    ("(" . ("(`!!')" "(" "((`!!'))"))
    ))
  (key-combo-define-hook key-combo-lisp-mode-hooks
                        'key-combo-lisp-load-default
                         key-combo-lisp-default)
  ;; web-mode-smartchr
  (setq key-combo-web-mode-hooks
        '(web-mode-hook))
  (setq key-combo-web-default
  '(
    ("<" . ("<" "<`!!'>"))
    ;; ("/" . ("/" "</`!!'>"))
    (">" . (">"))
    ("=" . ("="))
    ("*" . ("*"))
    ("!" . ("!" "<!-- `!!' -->"))
    ))
  (key-combo-define-hook key-combo-web-mode-hooks
                        'key-combo-web-load-default
                         key-combo-web-default)
)

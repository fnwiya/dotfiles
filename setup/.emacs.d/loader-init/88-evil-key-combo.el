(use-package key-combo
  :diminish key-combo-mode
  :commands (key-combo-mode)
  :init
  (loop for hook in *programing-hooks*
        do (add-hook hook 'key-combo-mode))
  :config
  ;; (global-key-combo-mode t)
  (key-combo-define evil-insert-state-map (kbd "=") '(" = " " == " "=" " === "))
  (key-combo-define evil-insert-state-map (kbd "+") '(" + " "+" " += " "++"))
  (key-combo-define evil-insert-state-map (kbd "-") '("-" " - " " -= " "--"))
  (key-combo-define evil-insert-state-map (kbd "*") '(" * " "*" " *= "))
  (key-combo-define evil-normal-state-map (kbd "/") 'key-combo-execute-orignal)
  (key-combo-define evil-insert-state-map (kbd "/") '("/" " / " "//" " /= " "/* `!!' */"))
  (key-combo-define evil-insert-state-map (kbd "%") '("%" " % " " %= "))
  (key-combo-define evil-insert-state-map (kbd "!") '("!" " != "))
  (key-combo-define evil-insert-state-map (kbd "&") '(" && " "&"))
  (key-combo-define evil-insert-state-map (kbd "|") '(" || " "|"))
  (key-combo-define evil-insert-state-map (kbd "?") '(" ? " "?"))
  (key-combo-define evil-insert-state-map (kbd "'") '("'`!!'\'" "'"))
  (key-combo-define evil-insert-state-map (kbd ",") '(", " "," ",\n"))
  (key-combo-define evil-insert-state-map (kbd "{") '("{\n`!!'\n}" "{" "{`!!'}" "{}"))
  (key-combo-define evil-insert-state-map (kbd "(") '("(`!!')" "(" "()"))
  (key-combo-define evil-insert-state-map (kbd "[") '("[`!!']" "[" "[]"))
  (key-combo-define evil-insert-state-map (kbd "<")  '(" < " " <= " "<" " << " "<<" "<`!!'>"))
  (key-combo-define evil-insert-state-map (kbd ">")  '(" > " " >= " ">" " >> " ">>"))
  (key-combo-define evil-insert-state-map (kbd "\"") '("\"`!!'\""  "\""  "\"\"\"`!!'\"\"\""))
  (key-combo-define evil-insert-state-map (kbd ";") '(";\n" ";"))
  (add-hook 'c-mode-common-hook
            (lambda()
              (key-combo-define evil-insert-state-map (kbd "&") '(" & " "&"))
              (key-combo-define evil-insert-state-map (kbd "|") '(" || " " | " "|"))
              (key-combo-define evil-insert-state-map (kbd "<")  '("<`!!'>" " < " "<"))
              (key-combo-define evil-insert-state-map (kbd "*")  '("* " "*"))
              ))
  (add-hook 'web-mode-hook
            (lambda()
              (key-combo-define evil-insert-state-map (kbd "<")  '("<" "<`!!'>"))
              (key-combo-define evil-insert-state-map (kbd "/")  '("/" "</`!!'>"))
              (key-combo-define evil-insert-state-map (kbd ">")  '(">"))
              (key-combo-define evil-insert-state-map (kbd "=")  '("="))
              (key-combo-define evil-insert-state-map (kbd "*")  '("*"))
              (key-combo-define evil-insert-state-map (kbd "!")  '("!" "<!-- `!!' -->"))
              ))
  (add-hook 'haskell-mode-hook
            (lambda()
              (key-combo-define evil-insert-state-map (kbd "<")  '("<" "<-"))
              (key-combo-define evil-insert-state-map (kbd ">")  '(">" "->"))
              ))
  (add-hook 'clojure-mode-hook
            (lambda()
              (key-combo-define evil-insert-state-map (kbd "{") '("{`!!'}" "{" "{}" "{\n`!!'\n}"))
              (key-combo-define evil-insert-state-map (kbd "=") '("= " "="))
              (key-combo-define evil-insert-state-map (kbd "+") '("+ " "+"))
              (key-combo-define evil-insert-state-map (kbd "-") '("-" "- "))
              (key-combo-define evil-insert-state-map (kbd "*") '("* " "*" "*`!!'*"))
              (key-combo-define evil-insert-state-map (kbd "<")  '("< " "<= " "<" " << " "<<" "<`!!'>"))
              (key-combo-define evil-insert-state-map (kbd ">")  '("> " ">= " ">" " >> " ">>"))
              (key-combo-define evil-insert-state-map (kbd "(") '("(`!!')" "(" "()" "((`!!'))"))
              (key-combo-define evil-insert-state-map (kbd "&") '("&"))
              (key-combo-define evil-insert-state-map (kbd "'") '("'"))
              (key-combo-define evil-insert-state-map (kbd ",") '(","))
              ))
  (add-hook 'lisp-mode-hook
            (lambda()
              (key-combo-define evil-insert-state-map (kbd "{") '("{`!!'}" "{" "{}" "{\n`!!'\n}"))
              (key-combo-define evil-insert-state-map (kbd "=") '("= " "="))
              (key-combo-define evil-insert-state-map (kbd "+") '("+ " "+"))
              (key-combo-define evil-insert-state-map (kbd "-") '("-" "- "))
              (key-combo-define evil-insert-state-map (kbd "*") '("* " "*" "*`!!'*"))
              (key-combo-define evil-insert-state-map (kbd "<")  '("< " "<= " "<" " << " "<<" "<`!!'>"))
              (key-combo-define evil-insert-state-map (kbd ">")  '("> " ">= " ">" " >> " ">>"))
              (key-combo-define evil-insert-state-map (kbd "(") '("(`!!')" "(" "()" "((`!!'))"))
              (key-combo-define evil-insert-state-map (kbd "&") '("&"))
              (key-combo-define evil-insert-state-map (kbd "'") '("'"))
              (key-combo-define evil-insert-state-map (kbd ",") '(","))
              (key-combo-define evil-insert-state-map (kbd "#") '("#'" "#'(lambda (`!!'))" "#"))
              ))
  )

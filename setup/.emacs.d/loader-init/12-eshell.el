;; prompt
(defvar eshell-prompt-function nil)
(setq eshell-prompt-function
      (lambda ()
        (concat "[fnwiya"
                (if (= (user-uid) 0) "]\n# " "]\n$ "))))

;; alias
(defvar eshell-command-aliases-list nil)
(setq eshell-command-aliases-list
      (append
       (list
        (list "ll" "ls -ltr")
        (list "la" "ls -a")
        (list "o" "xdg-open")
        (list "emacs" "find-file $1")
        (list "m" "find-file $1")
        (list "mc" "find-file $1")
        (list "d" "dired .")
        (list "l" "eshell/less $1"))))

;; find-file
(list "emacs" "find-file $1")
(list "m" "find-file $1")
(list "mc" "find-file $1")

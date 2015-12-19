;; http://d.hatena.ne.jp/higepon/20080731/1217491155
;; https://sites.google.com/site/ytakenaka/ja/emacs/autoinsert
(require 'autoinsert)
;; (setq user-fll-name "Fumiya Kohno")
(setq user-fll-name "Fnwiya")
(setq user-mail-address "fnwiya@gmail.com")

(setq auto-insert-query nil)
(setq auto-insert-directory "~/.emacs.d/insert-tmp/")

(setq auto-insert-alist
      (append  '(
               ("\\.cpp$" . ["template.cpp" my-template])
               ("\\.h$"   . ["template.h" my-template])
               ("\\.html$"   . ["template.html" my-template])
               ("readme.md"   . ["template.md" my-template])
               ("README.md"   . ["template.md" my-template])
               ("\\.sh$" . ["template.sh"
                            (lambda() (my-template-exec "/bin/sh"))
                            my-template])
               ("\\.py$" . ["template.sh"
                            (lambda() (my-template-exec "/usr/bin/python"))
                            my-template])
               ("\\.rb$" . ["template.sh"
                            (lambda() (my-template-exec "/usr/bin/ruby"))
                            my-template])
               ("\\.pl$" . ["template.sh"
                            (lambda() (my-template-exec "/usr/bin/perl"))
                            my-template])
               ) auto-insert-alist))

(require 'cl)

(defvar template-replacements-alists
  '(("%name%" . user-full-name)
    ("%mail%" . (lambda()(identity user-mail-address)))
    ("%file%"             . (lambda () (file-name-nondirectory (buffer-file-name))))
    ("%file-without-ext%" . (lambda () (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))))
    ("%include-guard%"    . (lambda () (format "__SCHEME_%s__" (upcase (file-name-sans-extension (file-name-nondirectory buffer-file-name))))))
    ("%cyear%" . (lambda()(substring (current-time-string) -4)))
    ;; ("%license%" . (lambda()(read-from-minibuffer "License: ")))
    ))

(defmacro defreplace (name replace-string)
  `(defun ,name (str)
     (goto-char (point-min))
     (replace-string ,replace-string str)))

(defreplace my-template-exec "%exec%")

(defun my-template ()
  (time-stamp)
  (mapc #'(lambda(c)
            (progn
              (goto-char (point-min))
              (replace-string (car c) (funcall (cdr c)) nil)))
        template-replacements-alists)
  (goto-char (point-max))
  (message "done."))

(add-hook 'find-file-not-found-hooks 'auto-insert)

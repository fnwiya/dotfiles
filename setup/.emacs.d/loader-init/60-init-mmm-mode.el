;; -*- coding: utf-8 -*-

;;;; mmm-mode configuration ;;;;;
;; load this file by using (load-file path-to-this-file)

;;; general configuration ;;;

                                        ;(require 'mmm-mode)
(require 'mmm-auto)
(setq mmm-submode-decoration-level 2)
(setq mmm-font-lock-available-p t)
(setq mmm-global-mode 'maybe)

 ;;;; color setting ;;;;
;; mmm-default-submode-face : javascript
;; mmm-code-submode-face : sql
;; mmm-comment-submode-face : comment
;; mmm-declaration-submode-face : perl

;;(set-face-bold-p 'mmm-default-submode-face t)

;; color setting for color-theme-snow
;; (set-face-background 'mmm-default-submode-face "LightCyan2")
;; (set-face-background 'mmm-code-submode-face "wheat")
;; (set-face-background 'mmm-comment-submode-face "gray76")
;; (set-face-background 'mmm-declaration-submode-face "thistle2")

;; color setting for color-theme-clarity
(set-face-background 'mmm-default-submode-face "gray30")
(set-face-background 'mmm-code-submode-face "gray15")
(set-face-background 'mmm-comment-submode-face "gray5")
(set-face-foreground 'mmm-comment-submode-face "red")
(set-face-background 'mmm-declaration-submode-face "gray45")
(set-face-background 'mmm-init-submode-face "gray10")
(set-face-background 'mmm-output-submode-face "gray30")
(set-face-background 'mmm-special-submode-face "gray5")
(set-face-foreground 'mmm-special-submode-face "goldenrod1")

 ;;; syntax ;;;

;; FSP
(mmm-add-mode-ext-class nil "\\.fsp\\'" 'fsp-group)
(mmm-add-group
 'fsp-group
 '(
   (fsp-code
    :submode js-mode
    :face mmm-default-submode-face
    :front "<%=?"
    :back "%>"
    )
   (fsp-comment
    :submode text-mode
    :face mmm-comment-submode-face
    :front "<%--"
    :back "--%>"
    )
   ))
(add-to-list 'auto-mode-alist '("\\.fsp\\'" . web-mode))

;; FSP in javascript
(mmm-add-mode-ext-class nil "\\.js\\'" 'fsp-in-js-group)
(mmm-add-group
 'fsp-in-js-group
 '(
   (html-mode1
    :submode web-mode
    :face mmm-code-submode-face
    :front "<%FSP%>"
    :back "</%FSP%>"
    )
   (js-in-fsp-mode
    :submode js-mode
    :face mmm-default-submode-face
    :front "<%=?"
    :back "%>"
    )
   (fsp-comment-mode
    :submode text-mode
    :face mmm-comment-submode-face
    :front "<%--"
    :back "--%>"
    )
   ))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))

;; Honeybee XML & SQLRepository.xml
                                        ;(mmm-add-mode-ext-class nil "\\.xml\\'" 'honeybee-xml-group)
(mmm-add-group
 'honeybee-xml-group
 '(
   (honeybee-xml-mode-sql
    :submode sql-mode
    :face mmm-code-submode-face
    :front "<statement[^>]*format=\"fsp\"[^>]*><\\!\\[CDATA\\["
    :back "\\]\\]></statement>"
    )
   (honeybee-xml-mode-sql2
    :submode sql-mode
    :face mmm-code-submode-face
    :front "<statement[^>]*scriptable=\"false\"[^>]*><\\!\\[CDATA\\["
    :back "\\]\\]></statement>"
    )
   (honeybee-xml-mode-sql3
    :submode sql-mode
    :face mmm-code-submode-face
    :front "<statement><\\!\\[CDATA\\["
    :back "\\]\\]></statement>"
    )
   (xml-sql
    :submode sql-mode
    :face mmm-code-submode-face
    :front "<sql>[ \t\n]*<\\!\\[CDATA\\["
    :back "\\]\\]>[ \t\n]*</sql>"
    )
   (xml-perl
    :submode perl-mode
    :face mmm-declaration-submode-face
    :front "<eval>"
    :back "</eval>"
    )
   ;; (perl-sql
   ;;	 :submode sql-mode
   ;;	 :face mmm-code-submode-face
   ;;	 :front "<<_SQL;"
   ;;	 :back "_SQL"
   ;;	 )
   (honeybee-xml-mode-fsp-comment
    :submode text-mode
    :face mmm-comment-submode-face
    :front "<%--"
    :back "--%>"
    )
   (honeybee-xml-mode-js
    :submode js-mode
    :face mmm-default-submode-face
    :front "<%=?"
    :back "%>"
    )
   (honeybee-xml-mode-js2
    :submode js-mode
    :face mmm-default-submode-face
    :front "<script><\\!\\[CDATA\\["
    :back "\\]\\]></script>"
    )
   (honeybee-xml-mode-js3
    :submode js-mode
    :face mmm-default-submode-face
    :front "<cache-name[^>]*scriptable=\"true\"[^>]*><\\!\\[CDATA\\["
    :back "\\]\\]></cache-name>"
    )
   (honeybee-xml-mode-js4
    :submode js-mode
    :face mmm-default-submode-face
    :front "<fail-safe[^>]*scriptable=\"true\"[^>]*><\\!\\[CDATA\\["
    :back "\\]\\]></fail-safe>"
    )
   (honeybee-xml-mode-js5
    :submode js-mode
    :face mmm-default-submode-face
    :front "<return[^>]*scriptable=\"true\"[^>]*><\\!\\[CDATA\\["
    :back "\\]\\]></return>"
    )
   ))
(add-to-list 'auto-mode-alist '("\\.xml\\'" . xml-mode))

;; mmm-mako 
;; https://bitbucket.org/pjenvey/mmm-mako
(require 'mmm-mako)
(add-to-list 'auto-mode-alist '("\\.sqltmpl\\'" . sql-mode))
(mmm-add-mode-ext-class 'sql-mode "\\.sqltmpl\\'" 'mako)

(global-set-key "\M-p"	 'mmm-parse-buffer)

;; タブの改善
;; (defun save-mmm-c-locals ()
;;	  (with-temp-buffer
;;	 (js-mode)
;;	 (dolist (v (buffer-local-variables))
;;	   (when (string-match "\\`c-" (symbol-name (car v)))
;;	(add-to-list 'mmm-save-local-variables `(,(car v) nil, mmm-c-derived-modes))))))
;; (save-mmm-c-locals)
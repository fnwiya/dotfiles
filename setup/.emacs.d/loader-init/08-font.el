(cond
 ((or (eq window-system 'ns) (eq window-system 'mac))
  (create-fontset-from-ascii-font "Ricty-14:weight=normal:slant=normal" nil "ricty")
  (set-fontset-font "fontset-ricty"
                    'unicode
                    (font-spec :family "Ricty" :size 30)
                    nil
                    'append)
  (add-to-list 'default-frame-alist '(font . "fontset-ricty"))
  ))

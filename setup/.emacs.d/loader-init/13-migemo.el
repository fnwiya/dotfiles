(use-package migemo
  :config
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  (cond
   ((or (eq window-system 'ns) (eq window-system 'mac))
    (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict") ; your installed path
    )
   ((eq system-type 'gnu/linux)
    (setq ubuntu_dict_path "/usr/share/cmigemo/utf-8/migemo-dict")
    (if (file-exists-p ubuntu_dict_path)
        (setq migemo-dictionary ubuntu_dict_path))
   ))
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init)
  )

(use-package tabbar
  :config
  (tabbar-mode 1)                          ; 1で表示/0で非表示
  (tabbar-mwheel-mode -1)                  ; タブ上でマウスホイール操作無効
  (setq tabbar-buffer-groups-function nil) ; グループ化しない
  (setq tabbar-use-images nil)             ; 画像を使わないことで軽量化する

  ;; 左に表示されるボタンを無効化
  (dolist (btn '(tabbar-buffer-home-button
                 tabbar-scroll-left-button
                 tabbar-scroll-right-button))
    (set btn (cons (cons "" nil)
                   (cons "" nil))))
  ;; タブに表示させるバッファの設定
  (defvar my-tabbar-displayed-buffers
    '("*Backtrace*" "*Colors*" "*Faces*" "*vc-" "*shell*" "*eshell*" "*terminal<1>*")
    "*Regexps matches buffer names always included tabs.")
  (defun my-tabbar-buffer-list ()
    "Return the list of buffers to show in tabs.
     Exclude buffers whose name starts with a space or an asterisk.
     The current buffer and buffers matches `my-tabbar-displayed-buffers'
     are always included."
    (let* ((hides (list ?\  ?\*))
           (re (regexp-opt my-tabbar-displayed-buffers))
           (cur-buf (current-buffer))
           (tabs (delq nil
                       (mapcar (lambda (buf)
                                 (let ((name (buffer-name buf)))
                                   (when (or (string-match re name)
                                             (not (memq (aref name 0) hides)))
                                     buf)))
                               (buffer-list)))))
      ;; Always include the current buffer.
      (if (memq cur-buf tabs)
          tabs
        (cons cur-buf tabs))))
  (setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

  ;; 見た目(mode-lineに合わせる)
  (setq tabbar-separator '(1.0))
  (set-face-attribute 'tabbar-default nil
                      :family (face-attribute 'mode-line-position-face :family)
                      :background (face-attribute 'mode-line-inactive :background)
                      :foreground (face-attribute 'mode-line-inactive :foreground)
                      :height (face-attribute 'mode-line-minor-mode-face :height)
                      :box nil)
  (set-face-attribute 'tabbar-unselected nil
                      :background (face-attribute 'mode-line-inactive :background)
                      :foreground (face-attribute 'mode-line-inactive :foreground)
                      :box nil)
  (set-face-attribute 'tabbar-selected nil
                      :background (face-attribute 'mode-line-filename-face :foreground)
                      :foreground (face-attribute 'mode-line :background)
                      :box nil)
  (set-face-attribute 'tabbar-modified nil
                      :background (face-attribute 'mode-line-modified-face :foreground)
                      :foreground (face-attribute 'mode-line :background)
                      :box nil)
  (set-face-attribute 'tabbar-separator nil
                      :background (face-attribute 'mode-line-inactive :background)
                      :foreground (face-attribute 'mode-line-inactive :background)
                      :height 1.0)
  (global-set-key [(C-tab)]   'tabbar-forward-tab)
  (global-set-key [(C-S-tab)] 'tabbar-backward-tab))

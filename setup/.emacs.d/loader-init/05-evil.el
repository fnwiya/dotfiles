(use-package evil
  :config
  (setq evil-cross-lines t
        evil-want-C-i-jump nil
        evil-search-module 'isearch
        )
  (setq indicate-empty-lines t)
  (setq indicate-buffer-boundaries 'left)
  (defun evil-escape-or-quit (&optional prompt)
    (interactive)
    (cond
     ((or (evil-normal-state-p) (evil-insert-state-p) (evil-visual-state-p)
          (evil-replace-state-p) (evil-visual-state-p)) [escape])
     (t (kbd "C-g"))))
  (define-key key-translation-map (kbd "C-v") #'evil-escape-or-quit)
  (define-key evil-operator-state-map (kbd "C-v") #'evil-escape-or-quit)
  (define-key evil-normal-state-map [escape] #'keyboard-quit)
  (evil-mode 1)
  (defun evil-swap-key (map key1 key2)
    ;; MAP中のKEY1とKEY2を入れ替え
    "Swap KEY1 and KEY2 in MAP."
    (let ((def1 (lookup-key map key1))
          (def2 (lookup-key map key2)))
      (define-key map key1 def2)
      (define-key map key2 def1)))
  (evil-swap-key evil-motion-state-map "j" "gj")
  (evil-swap-key evil-motion-state-map "k" "gk")
  (defadvice evil-paste-pop (around evil-paste-or-move-line activate)
    ;; evil-paste-popできなかったらprevious-lineする
    "If there is no just-yanked stretch of killed text, just move
to previous line."
    (condition-case err
        ad-do-it
      (error (if (eq this-command 'evil-paste-pop)
                 (call-interactively 'previous-line)
               (signal (car err) (cdr err))))))
  (defadvice evil-paste-pop-next (around evil-paste-or-move-line activate)
    ;; evil-paste-pop-nextできなかったらnext-lineする
    "If there is no just-yanked stretch of killed text, just move
to next line."
    (condition-case err
        ad-do-it
      (error (if (eq this-command 'evil-paste-pop-next)
                 (call-interactively 'next-line)
               (signal (car err) (cdr err))))))
  )

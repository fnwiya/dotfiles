(use-package evil
  :config
  ;; evil leader
  (setq evil-leader/in-all-states 1)
  (global-evil-leader-mode)
  (evil-leader/set-leader "SPC")
  ;; basic
  (setq evil-cross-lines t)  ;行の端でhlしたとき前/次の行に移動する
  (evil-want-C-i-jump nil)   ;C-iはTABとして使う
  (evil-search-module 'isearch)  ;searchはemacs風
  (setq indicate-empty-lines t)
  (setq indicate-buffer-boundaries 'left)
  (defun evil-escape-or-quit (&optional prompt)
    (interactive)
    (cond
     ((or (evil-normal-state-p) (evil-insert-state-p) (evil-visual-state-p)
          (evil-replace-state-p) (evil-visual-state-p)) [escape])
     (t (kbd "C-g"))))
  (define-key key-translation-map (kbd "C-q") #'evil-escape-or-quit)
  (define-key evil-operator-state-map (kbd "C-q") #'evil-escape-or-quit)
  (define-key evil-normal-state-map [escape] #'keyboard-quit)

  (evil-mode 1)
  ;; key-binding
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
  ;;cursor-color
  (setq evil-emacs-state-cursor '("red" box))
  (setq evil-normal-state-cursor '("green" box))
  (setq evil-visual-state-cursor '("orange" box))
  (setq evil-insert-state-cursor '("red" bar))
  (setq evil-replace-state-cursor '("red" bar))
  (setq evil-operator-state-cursor '("red" hollow))
  )

(use-package evil-matchit
  :config
(global-evil-matchit-mode 1))

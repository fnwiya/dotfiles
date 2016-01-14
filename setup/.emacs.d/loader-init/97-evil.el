(use-package evil
  :config
  ;; before (evil-mode 1)
  (setq evil-cross-lines t)  ;行の端でhlしたとき前/次の行に移動する
  (setq evil-want-C-i-jump nil)   ;C-iはTABとして使う
  (setq evil-search-module 'isearch)  ;searchはemacs風
  ;; (evil-ex-search-vim-style-regexp t) ;serch-moduleがevil-searchの場合に有効化
  (setq evil-esc-delay 0)
  ;; /before (evil-mode 1)
  (evil-mode 1)
  ;;cursor-color
  (setq evil-emacs-state-cursor '("red" box))
  (setq evil-normal-state-cursor '((face-attribute 'link :foreground) box))
  (setq evil-visual-state-cursor '("orange" box))
  (setq evil-insert-state-cursor '("red" bar))
  (setq evil-replace-state-cursor '("red" bar))
  (setq evil-operator-state-cursor '("red" hollow))
  (modify-syntax-entry ?_ "w" (standard-syntax-table)) ;_を単語境界にしない
  ;;ESCの割り当て
  (defun evil-escape-or-quit (&optional prompt)
    (interactive)
    (cond
     ((or (evil-normal-state-p) (evil-insert-state-p) (evil-visual-state-p)
          (evil-replace-state-p) (evil-visual-state-p)) [escape])
     (t (kbd "C-g"))))
  (define-key key-translation-map (kbd "C-q") #'evil-escape-or-quit)
  (define-key evil-operator-state-map (kbd "C-q") #'evil-escape-or-quit)
  (define-key evil-normal-state-map [escape] #'keyboard-quit)
  ;;物理行移動と論理行移動を入れ替え
  (defun evil-swap-key (map key1 key2)
    ;; MAP中のKEY1とKEY2を入れ替え
    "Swap KEY1 and KEY2 in MAP."
    (let ((def1 (lookup-key map key1))
          (def2 (lookup-key map key2)))
      (define-key map key1 def2)
      (define-key map key2 def1)))
  (evil-swap-key evil-motion-state-map "j" "gj")
  (evil-swap-key evil-motion-state-map "k" "gk")
  (setq evil-want-fine-undo t)    ;操作を元に戻す単位を細かくする
  (setq evil-mode-line-format 'before)
  )

(use-package evil-matchit
  ;;press "%" to jump between tag pair
  :config
  (global-evil-matchit-mode 1))

(use-package evil-leader
  :config
  ;; evil leader
  (setq evil-leader/in-all-states 1)
  (global-evil-leader-mode)
  (evil-leader/set-leader "SPC")
  (evil-leader/set-key
   "SPC" 'evil-buffer
   "a" 'ack-and-a-half
   "b" 'switch-to-buffer
   "B" 'ibuffer
   "d" 'kill-this-buffer
   "e" 'find-file
   "F" 'find-file
   "f" 'projectile-find-file
   "g" 'magit-status
   "h" 'evil-search-highlight-persist-remove-all
   "j" 'dired-jump
   "q" 'kill-buffer-and-window
   "t" 'other-window
   "w" 'save-buffer
   "x" 'smex
   ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; key-binding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(define-key evil-normal-state-map "\C-a" 'seq-home)
(define-key evil-insert-state-map "\C-a" 'seq-home)
(define-key evil-visual-state-map "\C-a" 'seq-home)
(define-key evil-motion-state-map "\C-a" 'seq-home)
(define-key evil-normal-state-map "\C-e" 'seq-end)
(define-key evil-insert-state-map "\C-e" 'seq-end)
(define-key evil-visual-state-map "\C-e" 'seq-end)
(define-key evil-motion-state-map "\C-e" 'seq-end)
(define-key evil-normal-state-map "\C-f" 'evil-forward-char)
(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
(define-key evil-normal-state-map "\C-b" 'evil-backward-char)
(define-key evil-insert-state-map "\C-b" 'evil-backward-char)
(define-key evil-visual-state-map "\C-b" 'evil-backward-char)
(define-key evil-normal-state-map "\C-d" 'evil-delete-char)
(define-key evil-insert-state-map "\C-d" 'evil-delete-char)
(define-key evil-visual-state-map "\C-d" 'evil-delete-char)
(define-key evil-normal-state-map "\C-n" 'evil-next-line)
(define-key evil-insert-state-map "\C-n" 'evil-next-line)
(define-key evil-visual-state-map "\C-n" 'evil-next-line)
(define-key evil-normal-state-map "\C-p" 'evil-previous-line)
(define-key evil-insert-state-map "\C-p" 'evil-previous-line)
(define-key evil-visual-state-map "\C-p" 'evil-previous-line)
(define-key evil-normal-state-map "\C-w" 'evil-delete)
(define-key evil-insert-state-map "\C-w" 'evil-delete)
(define-key evil-visual-state-map "\C-w" 'evil-delete)
(define-key evil-normal-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-y" 'yank)
(define-key evil-visual-state-map "\C-y" 'yank)
(define-key evil-normal-state-map "\C-k" 'kill-line)
(define-key evil-insert-state-map "\C-k" 'kill-line)
(define-key evil-visual-state-map "\C-k" 'kill-line)

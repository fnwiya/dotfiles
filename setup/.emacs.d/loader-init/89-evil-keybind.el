;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; key-binding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key evil-normal-state-map           [escape] 'keyboard-quit)
(define-key evil-visual-state-map           [escape] 'keyboard-quit)
(define-key minibuffer-local-map            [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map         [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map    [escape] 'minibuffer-keyboard-quit)
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
(define-key evil-visual-state-map "\C-f" 'evil-forward-char)
(define-key evil-normal-state-map "\C-l" 'evil-forward-char)
(define-key evil-insert-state-map "\C-l" 'evil-forward-char)
(define-key evil-visual-state-map "\C-l" 'evil-forward-char)
(define-key evil-normal-state-map "\C-b" 'evil-backward-char)
(define-key evil-insert-state-map "\C-b" 'evil-backward-char)
(define-key evil-visual-state-map "\C-b" 'evil-backward-char)
(define-key evil-normal-state-map "\C-d" 'evil-delete-char)
(define-key evil-insert-state-map "\C-d" 'evil-delete-char)
(define-key evil-visual-state-map "\C-d" 'evil-delete-char)
(define-key evil-normal-state-map "\C-n" 'evil-next-line)
(define-key evil-insert-state-map "\C-n" 'evil-next-line)
(define-key evil-visual-state-map "\C-n" 'evil-next-line)
(define-key evil-normal-state-map "\C-j" 'evil-next-line)
(define-key evil-insert-state-map "\C-j" 'evil-next-line)
(define-key evil-visual-state-map "\C-j" 'evil-next-line)
(define-key evil-normal-state-map "\C-p" 'evil-previous-line)
(define-key evil-insert-state-map "\C-p" 'evil-previous-line)
(define-key evil-visual-state-map "\C-p" 'evil-previous-line)
(define-key evil-normal-state-map "\C-k" 'evil-previous-line)
(define-key evil-insert-state-map "\C-k" 'evil-previous-line)
(define-key evil-visual-state-map "\C-k" 'evil-previous-line)
;; (define-key evil-normal-state-map "\C-k" 'kill-line)
;; (define-key evil-insert-state-map "\C-k" 'kill-line)
;; (define-key evil-visual-state-map "\C-k" 'kill-line)
(define-key evil-normal-state-map "\C-w" 'evil-delete)
(define-key evil-insert-state-map "\C-w" 'evil-delete)
(define-key evil-visual-state-map "\C-w" 'evil-delete)
(define-key evil-normal-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-y" 'yank)
(define-key evil-visual-state-map "\C-y" 'yank)
(define-key evil-normal-state-map "\C-t" 'other-window)
(define-key evil-insert-state-map "\C-t" 'other-window)
(define-key evil-visual-state-map "\C-t" 'other-window)
(define-key evil-motion-state-map "gt" 'tabbar-forward-tab)     ; タブ
(define-key evil-motion-state-map "gr" 'tabbar-backward-tab)    ; タブ
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)     ; 物理行移動
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line) ; 物理行移動
(define-key evil-normal-state-map (kbd "gj") 'evil-next-line)
(define-key evil-normal-state-map (kbd "gk") 'evil-previous-line)

;;ESCの割り当て
(defun evil-escape-or-quit (&optional prompt)
  (interactive)
  (cond
   ((or (evil-normal-state-p) (evil-insert-state-p) (evil-visual-state-p)
        (evil-replace-state-p) (evil-visual-state-p)) [escape])
   (t (kbd "C-g"))))
(define-key key-translation-map     (kbd "C-q") #'evil-escape-or-quit)
(define-key evil-operator-state-map (kbd "C-q") #'evil-escape-or-quit)

(add-hook 'term-mode-hook
          (lambda ()
            (evil-define-key 'normal term-raw-map
              "p" 'term-paste)
            (evil-define-key 'normal term-raw-map
              "\C-y" 'term-paste)
            (evil-define-key 'insert term-raw-map
              "\C-y" 'term-paste)
            (evil-define-key 'normal term-raw-map
              "\C-r" 'term-send-raw)
            (evil-define-key 'insert term-raw-map
              "\C-r" 'term-send-raw)
            ))

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
(define-key evil-normal-state-map "\C-t" 'other-window)
(define-key evil-insert-state-map "\C-t" 'other-window)
(define-key evil-visual-state-map "\C-t" 'other-window)
;;ESCの割り当て
(defun evil-escape-or-quit (&optional prompt)
  (interactive)
  (cond
   ((or (evil-normal-state-p) (evil-insert-state-p) (evil-visual-state-p)
        (evil-replace-state-p) (evil-visual-state-p)) [escape])
   (t (kbd "C-g"))))
(define-key key-translation-map     (kbd "C-q") #'evil-escape-or-quit)
(define-key evil-operator-state-map (kbd "C-q") #'evil-escape-or-quit)
;; (run-with-idle-timer 5 t 'evil-normal-state) ; 一定時間操作しないとノーマルモードに戻る
;; 物理行移動
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
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
;; ESC2回でtermのESC1回分、vimから抜ける。
(add-hook 'term-mode-hook
          (lambda ()
            (evil-define-key 'insert term-raw-map (kbd "ESC ESC")
              (lambda ()
                "ESCを渡す"
                (interactive)
                (term-send-raw)))
            ))

(use-package key-combo
  :commands (key-combo-mode)
  :init
  (loop for hook in *programing-hooks*
        do (add-hook hook 'key-combo-mode))
   :config
  ;; (global-key-combo-mode t)
  (key-combo-define evil-insert-state-map (kbd "=") '(" = " " == " "=" " === "))
  (key-combo-define evil-insert-state-map (kbd "+") '(" + " "+" " += " "++"))
  (key-combo-define evil-insert-state-map (kbd "-") '("-" " - " " -= " "--"))
  (key-combo-define evil-insert-state-map (kbd "*") '(" * " "*" " *= "))
  (key-combo-define evil-insert-state-map (kbd "/") '("/" " / " " /= " "/* `!!' */" "//"))
  (key-combo-define evil-insert-state-map (kbd "%") '("%" " % " " %= "))
  (key-combo-define evil-insert-state-map (kbd "!") '("!" " != "))
  (key-combo-define evil-insert-state-map (kbd "&") '(" && " "&"))
  (key-combo-define evil-insert-state-map (kbd "|") '(" || " "|"))
  (key-combo-define evil-insert-state-map (kbd "?") '(" ? " "?"))
  (key-combo-define evil-insert-state-map (kbd ",") '(", " "," ",\n"))
  (key-combo-define evil-insert-state-map (kbd "{") '("{\n`!!'\n}" "{" "{`!!'}" "{}"))
  (key-combo-define evil-insert-state-map (kbd "(") '("(`!!')" "(" "()"))
  (key-combo-define evil-insert-state-map (kbd "[") '("[`!!']" "[" "[]"))
  (key-combo-define evil-insert-state-map (kbd "<")  '(" < " " <= " " < " " << " "<<" "<`!!'>"))
  (key-combo-define evil-insert-state-map (kbd ">")  '(" > " " >= " " > " " >> " ">>"))
  (key-combo-define evil-insert-state-map (kbd "\"") '("\"`!!'\""  "\""  "\"\"\"`!!'\"\"\""))
  (key-combo-define evil-insert-state-map (kbd ";") '(";\n" ";"))
  )

(add-hook 'term-mode-hook
          '(lambda ()
             ))

(use-package evil
  :config
  ;; before (evil-mode 1)
  (setq evil-cross-lines t)           ;行の端でhlしたとき前/次の行に移動する
  (setq evil-want-C-i-jump nil)       ;C-iはTABとして使う
  (setq evil-search-module 'isearch)  ;searchはemacs風
  ;; (evil-ex-search-vim-style-regexp t) ;serch-moduleがevil-searchの場合に有効化
  ;; /before (evil-mode 1)
  (evil-mode 1)
  ;;cursor-color
  (setq evil-emacs-state-cursor    '("#E74C3C" box))
  (setq evil-normal-state-cursor   '("#3498DB" box))
  (setq evil-visual-state-cursor   '("#2ECC71" box))
  (setq evil-insert-state-cursor   '("#E74C3C" bar))
  (setq evil-replace-state-cursor  '("#E67E22" bar))
  (setq evil-operator-state-cursor '("#E74C3C" hollow))
  ;;その他の設定
  (setq evil-want-fine-undo t)     ;操作を元に戻す単位を細かくする
  (setq evil-move-cursor-back nil) ;改行文字の上に移動可能にする(C-x C-e用)
  (setq evil-esc-delay 0)
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
    ":" 'shell-command
    "a" 'avy-goto-word-0
    "b" 'helm-buffers-list
    "e" 'helm-find-files
    "f" 'projectile-find-file
    "g" 'magit-status
    "k" 'kill-this-buffer
    "q" 'kill-buffer-and-window
    "r" 'helm-recentf
    "s" 'isearch
    "t" 'other-window
    "w" 'save-buffer
    "x" 'helm-M-x
    ))

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

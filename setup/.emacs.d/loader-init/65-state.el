(use-package state
  :config
;;; stateのプレフィクスキーをC-M-sにする
;;; これはstate.elが読み込まれる/state-global-modeを有効にする前に設定
  (setq state-keymap-prefix (kbd "C-c s"))
;;; マイナーモードを有効にする
  (state-global-mode 1)

;;; バッファが表示中ならばそれに切替え、それ以外は別ウィンドウで表示
  (defun state-switch-buffer-other-window (buf)
    (if (get-buffer-window buf)
        (select-window (get-buffer-window buf))
      (switch-to-buffer-other-window buf)))

;;; [emacs-term state]emacs stateにてC-M-s zで専用のansi-termを開く
  (state-define-state
    emacs-term
    :key "z"
    ;; emacs stateから呼ばれたらこれを使う
    :bound emacs
    ;; *ansi-term (dotemacs)* バッファが存在するならば:switchで切替える
    :exist (get-buffer "*ansi-term (dotemacs)*")
    ;; *ansi-term (dotemacs)* 内ならば emacs-term state
    :in (equal (buffer-name) "*ansi-term (dotemacs)*")
    ;; バッファが存在するときに切替える方法
    :switch (state-switch-buffer-other-window "*ansi-term (dotemacs)*")
    ;; バッファが存在しないときはこれで作成する
    :create (ansi-term "/bin/zsh" "ansi-term (dotemacs)"))

;;; [term state]emacs state以外にてC-M-s zでansi-termを開く
  (state-define-state
    term
    :key "z"
    :exist (get-buffer "*ansi-term*")
    :in (equal (buffer-name) "*ansi-term*")
    :switch (state-switch-buffer-other-window "*ansi-term*")
    :create (ansi-term "/bin/zsh"))

;;; [eshell state]C-M-s rでeshellに切替える。shell-pop的な挙動。
;;; C-M-s r r ...で次々とeshellバッファを切替える
  (state-define-state
    eshell
    ;; sでもいいが、scratchで使われているので…
    :key "r"
    :in (string-prefix-p eshell-buffer-name (buffer-name))
    ;; :create→:switchの順番で呼ばれるので:switchでもよい
    :create eshell
    :keep eshell-next-buffer)
  (defun eshell-next-buffer (&optional previous)
    (interactive)
    (let ((bufs (funcall (if previous 'reverse 'identity) (eshell-buffer-names))))
      (switch-to-buffer (or (cadr (member (buffer-name) bufs))
                            (car bufs)))))
  )

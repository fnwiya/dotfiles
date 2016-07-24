(use-package state
  :config
;;; stateのプレフィクスキーをC-M-sにする
;;; これはstate.elが読み込まれる/state-global-modeを有効にする前に設定
  (setq state-keymap-prefix (kbd "C-M-s"))
;;; マイナーモードを有効にする
  (state-global-mode 1)

;;; [scratch state]C-M-s sで *scratch* に切替える
  (state-define-state
    scratch
    :key "s"
    :switch "*scratch*")

;;; [messages state]C-M-s mで *Messages* に切替える
  (state-define-state
    messages
    :key "m"
    :switch "*Messages*")

;;; [twit state]C-M-s tでtwittering-modeに切替える
  (state-define-state
    twit
    :key "t"
    ;; この条件を満たすときにtwit stateとみなす
    :in (and (require 'twittering-mode nil t) (twittering-buffer-p))
    ;; (twit) でtwittering-modeにする
    :switch twit)

;;; [emacs state]C-M-s eでEmacs設定ファイルを編集する
  (state-define-state
    emacs
    :key "e"
    ;; ~/.emacs.d/initから始まるファイル (~/.emacs.d/init*) を開いているときemacs stateとみなす
    ;; :inが文字列で:existが指定されていないとき:inで指定されたファイルのうち
    ;; 最も最近指定されたバッファに切替える
    :in "~/.emacs.d/init"
    ;; どれも見付からないときは init.el を開く
    :create (find-file "~/.emacs.d/init.el"))

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

;;; [gnus state]C-M-s gでgnusを開く
  (state-define-state
    gnus
    :key "g"
    :in (memq major-mode
              '(message-mode
                gnus-group-mode
                gnus-summary-mode
                gnus-article-mode))
    :create gnus)
;;; [mew state]C-M-s Mでmewを開く
  (state-define-state
    mew
    :key "M"
    :exist (cl-some (lambda (b) (eq 'mew-summary-mode (buffer-local-value 'major-mode b)))
                    (buffer-list))
    :in (string-match "^mew-" (symbol-name major-mode))
    :create (progn (delete-other-windows) (mew)))
;;; [erc state]C-M-s iでircを開く
  (state-define-state
    erc
    :key "i"
    :in (memq (current-buffer)
              (erc-buffer-list))
    :switch (erc-start-or-switch 1)
    ;; C-M-s i i ... で次々とercバッファに切替える
    :keep (erc-track-switch-buffer 0))

  (defun erc-start-or-switch (arg)
    "Connect to ERC, or switch to last active buffer"
    (interactive "P")
    (if (and (get-buffer "irc.freenode.net:6667")
             (erc-server-process-alive (get-buffer "irc.freenode.net:6667")))
        (erc-track-switch-buffer 1)
      (when (or arg (y-or-n-p "Start ERC? "))
        (erc :server "irc.freenode.net"
             :port 6667
             :nick "thisirs"
             :password (secrets-get-secret "Default" "NickServ")))))

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


;;; 専用のrepl stateを定義するマクロ
  (defmacro state-define-repl (name key buffer-name from create)
    `(state-define-state
       ,name
       ;; :boundがS式の場合はその条件を満たす専用のstateに切替える
       :bound ,from
       :key ,key
       :exist (get-buffer ,buffer-name)
       :in (equal (buffer-name) ,buffer-name)
       ;; :existを満たすならば切替える
       :switch (state-switch-buffer-other-window ,buffer-name)
       ;; :existを満たさないなら作成する
       :create (progn
                 (switch-to-buffer-other-window (current-buffer))
                 ,create)))
  (put 'state-define-repl 'lisp-indent-function 3)

;;; [elisp-repl state]emacs-lisp-modeにてC-M-s jでielm
  (state-define-repl elisp-repl "j" "*ielm*"
                     (eq major-mode 'emacs-lisp-mode)
                     (ielm))
;;; [matlab-repl]matlab-modeにてC-M-s jでmatlab-shell
  (state-define-repl matlab-repl "j" "*MATLAB*"
                     (eq major-mode 'matlab-mode)
                     (matlab-shell))
;;; [python-repl]python-modeにてC-M-s jでrun-python
  (state-define-repl python-repl "j" "*Python*"
                     (eq major-mode 'python-mode)
                     (run-python "/usr/bin/python2.7"))
;;; [ruby-repl]ruby-modeにてC-M-s jでinf-ruby
  (state-define-repl ruby-repl "j" "*ruby*"
                     (eq major-mode 'ruby-mode)
                     (inf-ruby))
  )

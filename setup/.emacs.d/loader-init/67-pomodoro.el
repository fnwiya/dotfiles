;;; http://syohex.hatenablog.com/entry/20121215/1355579575
(add-to-list 'load-path "~/.emacs.d/elisp/vendor/pomodoro.el")

;; 作業時間終了後に開くファイル。デフォルトでは "~/.emacs.d/pomodoro.org"
(setq pomodoro:file "~/.emacs.d/mywork.txt")

;; 作業終了後の hook
(add-hook 'pomodoro:finish-work-hook
          (lambda ()
            (my/pomodoro-notification :body "Work is Finish")))

;; 休憩終了後の hook
(add-hook 'pomodoro:finish-rest-hook
          (lambda ()
            (my/pomodoro-notification :body "Break time is finished")))

;; 長期休憩後の hook
(add-hook 'pomodoro:long-rest-hook
          (lambda ()
            (my/pomodoro-notification :body "Long Break time now")))

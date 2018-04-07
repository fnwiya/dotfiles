(when (window-system)
  (add-hook 'after-init-hook
            (lambda()
              (set-frame-position (selected-frame) 0 0)
              ;; (setq w (selected-window))
              ;; (setq w2 (split-window w (- (window-height w) 8)))
              ;; (select-window w2)
              ;; (multi-term)
              ;; (select-window w)
              (recentf-open-files)
              (cond
               ((or (eq window-system 'ns) (eq window-system 'mac))
                ;; MacBook Air (11-inch, Mid 2013)
                (set-frame-size (selected-frame) 91 47)
                (save-window-excursion
                  (async-shell-command "brew update && brew upgrade && brew doctor")))
               ((and (window-system) (eq system-type 'gnu/linux))
                (cond
                 ((equal user-login-name "forcia")
                  (set-frame-size (selected-frame) 101 50)
                  (save-window-excursion
                    (async-shell-command "sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade && sudo apt-get -y autoremove")))))))))
(unless (window-system)
  (add-hook 'after-init-hook
            (lambda()
              (recentf-open-files))))
(add-hook 'after-init-hook
            (lambda()
              (kill-buffer "*scratch*")))

(defun reset-window()
  (interactive)
  (delete-other-windows)
  (setq w (selected-window))
  (setq w2 (split-window w (- (window-height w) 8))))

;; check-frame-size
;; at *scratch*
;; (frame-height) => C-j
;; (frame-width)  => C-j

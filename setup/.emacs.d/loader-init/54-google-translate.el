(use-package google-translate
;; C-c C-t (regionあり): regionを翻訳
;; C-c C-t (regionなし): 現在のセンテンスを翻訳
;; C-u C-c C-t: 入力文字列を翻訳
;; (google-translate-enja-or-jaen “english string”): 英語→日本語
;; (google-translate-enja-or-jaen “日本語文字列”): 日本語→英語
  :config
  (defvar google-translate-english-chars "[:ascii:]"
    "これらの文字が含まれているときは英語とみなす")
  (defun google-translate-enja-or-jaen (&optional string)
    "regionか、現在のセンテンスを言語自動判別でGoogle翻訳する。"
    (interactive)
    (setq string
          (cond ((stringp string) string)
                (current-prefix-arg
                 (read-string "Google Translate: "))
                ((use-region-p)
                 (buffer-substring (region-beginning) (region-end)))
                (t
                 (save-excursion
                   (let (s)
                     (forward-char 1)
                     (backward-sentence)
                     (setq s (point))
                     (forward-sentence)
                     (buffer-substring s (point)))))))
    (let* ((asciip (string-match
                    (format "\\`[%s]+\\'" google-translate-english-chars)
                    string)))
      (run-at-time 0.1 nil 'deactivate-mark)
      (google-translate-translate
       (if asciip "en" "ja")
       (if asciip "ja" "en")
       string)))
    (global-set-key (kbd "C-c C-t") 'google-translate-enja-or-jaen)
    (push '("*Google Translate*") popwin:special-display-config)
)

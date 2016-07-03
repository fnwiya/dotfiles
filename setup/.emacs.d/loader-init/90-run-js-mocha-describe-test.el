;; http://blog.shibayu36.org/entry/2016/04/25/180000
;; gitで管理されているrepositoryのトップディレクトリを探すUtility
(defun git-root-directory ()
  (cond ((git-project-p)
         (chomp
          (shell-command-to-string "git rev-parse --show-toplevel")))
        (t
         "")))

(defun run-js-mocha-describe-test ()
  (interactive)
  (let* ((topdir (git-root-directory))
         (test-grep-args nil))
    (save-excursion
      (when (or
             ;; 直近もしくは直後でdescribe('テスト名')となっている場所を探し、テスト名を抜き出す
             (re-search-backward "\\bdescribe(\s*[\"']\\(.*?\\)[\"']" nil t)
             (re-search-forward "\\bdescribe(\s*[\"']\\(.*?\\)[\"']" nil t))
        (setq test-grep-args (match-string 1))))
    (if test-grep-args
        ;; テスト名があったらquickrunを用いて
        ;; $(npm bin)/karma run -- --grep 'テスト名'
        ;; のようなコマンドを実行する
        (quickrun
         :source
         `((:command . "$(npm bin)/karma")
           (:default-directory . ,topdir)
           (:exec . (,(concat "%c run -- --grep " test-grep-args))))))))

(use-package web-mode
  :mode
  (("\\.html?\\'" . web-mode)
   ("\\.php\\'" . web-mode)
   ("\\.hbs\\'" . web-mode)
   ("\\.jsp\\'" . web-mode)
   ("\\.fsp\\'" . web-mode)
   ("\\.gsp\\'" . web-mode))
  :config
  ;; web-modeの設定
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq indent-tabs-mode t)
  (setq web-mode-indent-style 2)
  )

;;; http://blog.binchen.org/posts/effective-spell-check-in-emacs.html
(defun web-mode-flyspell-verify ()
  (let ((f (get-text-property (- (point) 1) 'face))
        thing
        rlt)
    (cond
     ((not (memq f '(web-mode-html-attr-value-face
                     web-mode-html-tag-face
                     web-mode-html-attr-name-face
                     web-mode-constant-face
                     web-mode-doctype-face
                     web-mode-keyword-face
                     web-mode-comment-face ;; focus on get html label right
                     web-mode-function-name-face
                     web-mode-variable-name-face
                     web-mode-css-property-name-face
                     web-mode-css-selector-face
                     web-mode-css-color-face
                     web-mode-type-face
                     web-mode-block-control-face)
                 ))
      (setq rlt t))
     ((memq f '(web-mode-html-attr-value-face))
      (save-excursion
        (search-backward-regexp "=['\"]" (line-beginning-position) t)
        (backward-char)
        (setq thing (thing-at-point 'symbol))
        (setq rlt (string-match "^\\(value\\|class\\|ng[A-Za-z0-9-]*\\)$" thing))
        rlt))
     (t t))
    rlt))

(put 'web-mode 'flyspell-mode-predicate 'web-mode-flyspell-verify)

(defvar flyspell-check-doublon t
  "Check doublon (double word) when calling `flyspell-highlight-incorrect-region'.")
 (make-variable-buffer-local 'flyspell-check-doublon)

(defadvice flyspell-highlight-incorrect-region (around flyspell-highlight-incorrect-region-hack activate)
  (if (or flyspell-check-doublon (not (eq 'doublon (ad-get-arg 2))))
      ad-do-it))

(defun web-mode-hook-setup ()
  (flyspell-mode 1)
  (setq flyspell-check-doublon nil))

(add-hook 'web-mode-hook 'web-mode-hook-setup)

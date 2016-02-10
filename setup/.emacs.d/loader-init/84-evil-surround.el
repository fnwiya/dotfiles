;; https://github.com/timcharper/evil-surround
(use-package evil-surround
  ;; word:ysiw<somekey> / line:yss<somekey>
  :config
  (global-evil-surround-mode 1)
  (push '(?< . ("< " . " >")) evil-surround-pairs-alist))

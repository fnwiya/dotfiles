(use-package ripgrep
  :config
  ;; rgバイナリの位置
  (setq ripgrep-executable "~/.cargo/bin/rg")
  ;; rgに渡すオプション
  (setq ripgrep-arguments '("-S")))

(use-package projectile-ripgrep)

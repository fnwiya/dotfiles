(use-package hydra-examples
  :config
  (global-set-key
   (kbd "C-M-s")
   (defhydra hydra-splitter (:color red)
     "splitter"
     ("h" hydra-move-splitter-left)
     ("j" hydra-move-splitter-down)
     ("k" hydra-move-splitter-up)
     ("l" hydra-move-splitter-right)))
)
  (defhydra hydra-zoom (global-map "<f2>")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))
  (global-set-key
   (kbd "C-M-s")
   (defhydra hydra-splitter ()
     "splitter"
     ("h" hydra-move-splitter-left)
     ("j" hydra-move-splitter-down)
     ("k" hydra-move-splitter-up)
     ("l" hydra-move-splitter-right)))
(require 'windmove)
(require 'framemove)
(setq framemove-hook-into-windmove t)

(defun hydra-move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (shrink-window-horizontally arg)
    (enlarge-window-horizontally arg)))

(defun hydra-move-splitter-right (arg)
  "Move window splitter right."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (enlarge-window-horizontally arg)
    (shrink-window-horizontally arg)))

(defun hydra-move-splitter-up (arg)
  "Move window splitter up."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (enlarge-window arg)
    (shrink-window arg)))

(defun hydra-move-splitter-down (arg)
  "Move window splitter down."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (shrink-window arg)
    (enlarge-window arg)))
)

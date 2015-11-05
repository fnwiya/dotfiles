#!/bin/bash
# https://www.quicklisp.org/beta/
curl -O https://beta.quicklisp.org/quicklisp.lisp
curl -O https://beta.quicklisp.org/quicklisp.lisp.asc
sbcl --load quicklisp.lisp
# * (quicklisp-quickstart:install)
# * (ql:add-to-init-file)

# * (ql:quickload :cl-ppcre) install
# * (ql:system-apropos "web") search
# * (ql:update-all-dists) update

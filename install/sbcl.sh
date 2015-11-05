#!/bin/bash
# https://www.quicklisp.org/beta/
curl -O https://beta.quicklisp.org/quicklisp.lisp
curl -O https://beta.quicklisp.org/quicklisp.lisp.asc
echo "(quicklisp-quickstart:install)"
echo "(ql:add-to-init-file)"
sbcl --load quicklisp.lisp

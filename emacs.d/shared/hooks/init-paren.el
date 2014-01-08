(require 'cl)

(setq show-paren-style 'mixed)

(defun enable-show-paren-mode () (show-paren-mode t))

(add-hooks
 '(clojure-mode-hook
   emacs-lisp-mode-hook
   lisp-interaction-mode-hook
   lisp-mode-hook
   scheme-mode-hook)
 '(enable-show-paren-mode))

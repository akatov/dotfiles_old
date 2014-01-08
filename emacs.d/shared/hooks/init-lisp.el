(require 'cl)

(defun setup-eval-print-last-sexp ()
  (local-set-key (kbd "C-S-j") 'eval-print-last-sexp))

;; (loop for mode-hook in
;;       '(lisp-interaction-mode-hook
;;         lisp-mode-hook
;;         emacs-lisp-mode-hook)
;;       do
;;       (add-hook mode-hook 'turn-on-eldoc-mode)
;;       (add-hook mode-hook 'setup-eval-print-last-sexp))

(add-hooks
 '(lisp-interaction-mode-hook
   lisp-mode-hook
   emacs-lisp-mode-hook)
 '(turn-on-eldoc-mode
   setup-eval-print-last-sexp))

(add-to-list 'auto-mode-alist '("Carton" . emacs-lisp-mode))

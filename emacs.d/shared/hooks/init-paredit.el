(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)

(defvar electrify-return-match
  "[\]}\)\"]"
  "If this regexp matches the text after the cursor, do an \"electric\"
  return.")

(defun electrify-return-if-match (arg)
  "If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
        (save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))

(defun activate-electrify-return ()
  (local-set-key (kbd "RET") 'electrify-return-if-match))

(defun activate-clojure-paredit-curly ()
  (define-key clojure-mode-map "{" 'paredit-open-curly)
  (define-key clojure-mode-map "}" 'paredit-close-curly))

;; (defun activate-js2-paredit-curly ()
;;   (define-key js2-mode-map "{" 'paredit-open-curly)
;;   (define-key js2-mode-map "}" 'paredit-close-curly))

(defun setup-paredit-eldoc-commands ()
  (turn-on-eldoc-mode)
  (eldoc-add-command 'paredit-backward-delete
                     'paredit-close-round
                     'electrify-return-if-match))

(add-hook 'clojure-mode-hook 'activate-clojure-paredit-curly)
;;(add-hook 'js2-mode-hook 'activate-js2-paredit-curly)

(add-hooks '(emacs-lisp-mode-hook)
           '(activate-electrify-return
             setup-paredit-eldoc-commands))

;;; paredit doesn't do this automatically
(add-hooks
 '(clojure-mode-hook
   emacs-lisp-mode-hook
   lisp-interaction-mode-hook
   lisp-mode-hook
   scheme-mode-hook)
 '(enable-paredit-mode))

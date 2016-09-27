(setq gc-cons-threshold 400000000)

(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  ;; (scroll-bar-mode -1)
  (tooltip-mode -1))

;; load hooks
(defun add-hooks (mode-hooks hooks)
  (loop for mode-hook in mode-hooks do
        (loop for hook in hooks do
              (add-hook mode-hook hook))))

;; package
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("SC" . "http://joseito.republika.pl/sunrise-commander/") t)
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; load the config
(org-babel-load-file
 (concat user-emacs-directory "config.org"))

;; fullscreen
;; (defun toggle-fullscreen ()
;;   "Toggle full screen"
;;   (interactive)
;;   (set-frame-parameter
;;    nil 'fullscreen (unless (frame-parameter nil 'fullscreen) 'fullboth)))
;; (global-set-key (kbd "s-<return>") 'toggle-fullscreen)

;; (mapc (lambda (f) (load f)) (f-files "~/.emacs.d/hooks"))

(setq inferior-js-program-command "node")

(setq gc-cons-threshold 800000)



;;; temporary stuff. MOVE THIS OUT OF HERE:

;; (defun hs-hide-all-comments ()
;;   "Hide all top level blocks, if they are comments, displaying only first line.
;; Move point to the beginning of the line, and run the normal hook
;; `hs-hide-hook'.  See documentation for `run-hooks'."
;;   (interactive)
;;   (hs-life-goes-on
;;    (save-excursion
;;      (unless hs-allow-nesting
;;        (hs-discard-overlays (point-min) (point-max)))
;;      (goto-char (point-min))
;;      (let ((spew (make-progress-reporter "Hiding all comment blocks..."
;;                                          (point-min) (point-max)))
;;            (re (concat "\\(" hs-c-start-regexp "\\)")))
;;        (while (re-search-forward re (point-max) t)
;;          (if (match-beginning 1)
;;            ;; found a comment, probably
;;            (let ((c-reg (hs-inside-comment-p)))
;;              (when (and c-reg (car c-reg))
;;                (if (> (count-lines (car c-reg) (nth 1 c-reg)) 1)
;;                    (hs-hide-block-at-point t c-reg)
;;                  (goto-char (nth 1 c-reg))))))
;;          (progress-reporter-update spew (point)))
;;        (progress-reporter-done spew)))
;;    (beginning-of-line)
;;    (run-hooks 'hs-hide-hook)))

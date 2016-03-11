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

;; load hooks
(defun add-hooks (mode-hooks hooks)
  (loop for mode-hook in mode-hooks do
        (loop for hook in hooks do
              (add-hook mode-hook hook))))
(mapc (lambda (f) (load f)) (f-files "~/.emacs.d/hooks"))

(setq inferior-js-program-command "node")

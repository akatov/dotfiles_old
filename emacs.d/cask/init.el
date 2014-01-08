;; always ask y-or-n questions
(fset 'yes-or-no-p 'y-or-n-p)

;; Movement between windows
(global-set-key "\M-g\M-h" 'windmove-left)
(global-set-key "\M-g\M-l" 'windmove-right)
(global-set-key "\M-g\M-k" 'windmove-up)
(global-set-key "\M-g\M-j" 'windmove-down)
(global-set-key "\M-gh" 'windmove-left)
(global-set-key "\M-gl" 'windmove-right)
(global-set-key "\M-gk" 'windmove-up)
(global-set-key "\M-gj" 'windmove-down)

;; fullscreen
(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
   nil 'fullscreen (unless (frame-parameter nil 'fullscreen) 'fullboth)))
(global-set-key (kbd "s-<return>") 'toggle-fullscreen)

;; load custom
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; load packages through Cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; load hooks
(defun add-hooks (mode-hooks hooks)
  (loop for mode-hook in mode-hooks do
        (loop for hook in hooks do
              (add-hook mode-hook hook))))
(mapc (lambda (f) (load f)) (f-files "~/.emacs.d/hooks"))

;; START gtd
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files
      (list "~/org/gtd/gtd.org"
            "~/org/gtd/work.org"
            "~/org/gtd/personal.org"))

(setq org-return-follows-link t)

(setq org-agenda-custom-commands
      '(("w" todo "WAITING" nil)
        ("n" todo "NEXT" nil)
        ("d" "Agenda + Next Actions" ((agenda) (todo "NEXT")))))

(defun gtd ()
  (interactive)
  (find-file "~/org/gtd/gtd.org"))
;; END gtd

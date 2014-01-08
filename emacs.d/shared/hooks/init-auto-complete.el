(require 'auto-complete-config)
(ac-config-default)
(define-key ac-completing-map "\M-/" 'ac-stop)

(define-key ac-completing-map "\C-m" nil)
;; (setq ac-use-menu-map t)
;; (define-key ac-menu-map "\C-m" 'ac-complete)

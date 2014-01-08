(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)

(add-hook 'nrepl-mode-hook
          'enable-paredit-mode)

;(setq nrepl-popup-stacktraces nil)

;(add-to-list 'same-window-buffer-names "*nrepl*")

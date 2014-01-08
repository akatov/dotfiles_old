(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-c C-SPC") 'ace-jump-mode)
(global-set-key (kbd "C-;") 'ace-jump-mode)

(add-hook 'org-mode-hook
          (lambda ()
            (when (search-forward-regexp "#\+property: orgtrello-user-me " 10000000 t)
              (org-trello-mode)
              (goto-line 1))))

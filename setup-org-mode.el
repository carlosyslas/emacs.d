(setq google-drive-dir "~/Google Drive/")
(setq org-capture-templates
      '(("i" "Inbox" entry (file (expand-file-name "org/inbox.org" google-drive-dir)  "Inbox")
         "* TODO %?\n"
         )
        ))

(setq org-src-fontify-natively t)

(global-unset-key (kbd "C-o"))
(global-set-key (kbd "C-o c") 'org-capture)

(provide 'setup-org-mode)

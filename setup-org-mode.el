(setq google-drive-dir "~/Google Drive/")
(setq org-capture-templates
      '(("i" "Inbox" entry (file (expand-file-name "org/inbox.org" google-drive-dir)  "Inbox")
         "* TODO %?\n"
         )
        ))

(provide 'setup-org-mode)

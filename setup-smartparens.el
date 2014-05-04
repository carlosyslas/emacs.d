;; #setup-smartparens
;;
;; Configures smartparens

(defun setup-smartparens ()
  (smartparens-global-mode 1)
  (sp-with-modes '(html-mode sgml-mode)
    (sp-local-pair "<" ">"))
  (sp-with-modes '(go-mode)
    (sp-local-pair "/*" "*/"))
  )

(add-hook 'after-init-hook 'setup-smartparens)

(provide 'setup-smartparens)

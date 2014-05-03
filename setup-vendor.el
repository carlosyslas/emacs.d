;; Packages to install
;; helm
;; helm-open-github MUST!
;; guide-key
;; js2-mode
;; magit
;; smartparens
;; helm-css-scss
;; [may be]
;; helm-spotify
;; bind-key

;; TODO: Extract smartparens to it's own file. So we mantain the vendor file clean

(require 'setup-helm)

(add-hook 'sgml-mode-hook 'zencoding-mode)

(defun setup-smartparens ()
  (smartparens-global-mode 1)
  (sp-with-modes '(html-mode sgml-mode)
    (sp-local-pair "<" ">"))
  (sp-with-modes '(org-mode)
    (sp-local-pair "/*" "*/"))
  )

(add-hook 'after-init-hook 'setup-smartparens)

;; Magit
(global-set-key (kbd "<f5>") 'magit-status)

(provide 'setup-vendor)
;; End of setup-vendor.el

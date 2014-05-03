(require 'package)

(package-initialize)

;; Repositories
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(setq required-packages '(
                          helm
                          helm-open-github
                          guide-key
                          js2-mode
                          magit
                          smartparens
                          helm-css-scss
                          helm-spotify
                          bind-key
                          org-pomodoro
                          ace-jump-mode
                          auto-complete
                          ))

(defun ensure-package-installed (package)
  ""
  (unless (package-installed-p package)
    (package-install package)
    )
  )

(defun ensure-packages-installed (packages)
  ""
  (dolist (package packages)
    (ensure-package-installed package)
    )
  )

(ensure-packages-installed required-packages)


(provide 'setup-package)

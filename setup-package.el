(require 'package)

(package-initialize)

;; Repositories
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(setq required-packages '(
                          dash
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
                          fringe-helper
                          git-gutter-fringe+
                          rainbow-mode
                          markdown-mode
                          go-mode
                          go-eldoc
                          go-autocomplete
                          ace-window
                          expand-region
                          ;; ERC
                          erc-hl-nicks

                          ;;A evaluar
                          ;; flx-ido ;; Estoy casi seguro que regresare a ido pero usare helm para algunas cosas
                          ;; web-beautify ;; Necesita nodejs y js-beautify
                          ;; vagrant
                          ;; projectile ;; Bastante interesante!
                          ;; helm-projectile
                          ;; go-projectile
                          ;; exercism
                          ;; ac-js2
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

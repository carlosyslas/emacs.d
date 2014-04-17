(add-to-list 'load-path user-emacs-directory) ;; ~/.emacs.d
(setq is-mac (equal system-type 'darwin))

;; Repositories
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'setup-misc)
(require 'setup-file-associations)

(require 'setup-org-mode)

(when is-mac
  (require 'setup-mac-osx)) 
(require 'setup-key-bindings)
;; End of init.el



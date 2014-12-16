(org-babel-load-file (expand-file-name "Carlos.org" user-emacs-directory))

(require 'setup-vendor)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'setup-misc)
(require 'setup-file-associations)

(require 'setup-org-mode)

(require 'setup-eldoc)

(when is-mac
  (require 'setup-mac-osx)) 

;; Setup vendor. This should remain disabled until I figure out how to auto install the required packages

(require 'setup-key-bindings)


(require 'numeric-bookmarks)

;; This file is for the local environment configuration
;; It should contain things like environment variables setup,
;; python virtual environments, and all kind of things that would
;; change deppending on the current development environment.
(let ((local-environment-setup-file (expand-file-name "local-env.el" user-emacs-directory)))
  (when (file-exists-p local-environment-setup-file)
    (load-file local-environment-setup-file)))
;; End of init.el











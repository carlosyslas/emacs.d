(org-babel-load-file (expand-file-name "Carlos.org" user-emacs-directory))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load-file-if-exists "custom.el")

;; This file is for the local environment configuration
;; It should contain things like environment variables setup,
;; python virtual environments, and all kind of things that would
;; change deppending on the current development environment.
(load-file-if-exists "local-env.el")

;; This file is for the stuff I'm currently working on.
(load-file-if-exists "experimental.el")

;; End of init.el

(add-to-list 'load-path user-emacs-directory) ;; ~/.emacs.d
(setq is-mac (equal system-type 'darwin))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'setup-misc)
(require 'setup-file-associations)

(when is-mac
  (require 'setup-mac-osx)) 
(require 'setup-key-bindings)
;; End of init.el

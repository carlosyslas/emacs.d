;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(defun load-file-if-exists (file-name)
  (let ((file-path (expand-file-name file-name user-emacs-directory)))
    (when (file-exists-p file-path)
      (load-file file-path))))
(load-file-if-exists "custom.el")

(add-to-list 'load-path "~/.emacs.d/self")
;;(require 'self)
(load-file "~/.emacs.d/self.el")

(org-babel-load-file (expand-file-name "README.org" user-emacs-directory))

(require 'common)
(require 'programing)

(eval-when-compile
  (require 'use-package))

;; (use-package lsp-mode
;;   :config
;;   (require 'lsp-imenu)
;;   (add-hook 'lsp-after-open-hook 'lsp-enable-imenu))

;; (use-package lsp-javascript-flow)

(use-package js2-refactor)

(use-package xref-js2)

(use-package rjsx-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))
  (define-key js2-mode-map (kbd "M-.") nil)
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  (add-hook 'js2-mode-hook (lambda ()
                             (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)
                             (superword-mode 1)
                             (prettier-js-mode)
                             ;;(lsp-javascript-flow-enable)
                             )))

(use-package flycheck-flow)

(use-package indium)

(use-package yasnippet
  :config
  (yas-global-mode))

(use-package flx)

(use-package helm
  :config
  (require 'helm-config))

(use-package avy
  :bind (("C-c s" . avy-goto-word-1)))

(use-package bind-key)

;;* Dired config
(require 'dired)
(bind-key "C-c d" 'dired-jump)
(use-package dired-narrow)

(use-package expand-region
  :bind (("C-c e" . er/expand-region)))

(use-package smartparens
  :config
  (require 'smartparens-config))

;; Perspective mode is not working well with desktop-save-mode
;; (use-package perspective
;;   :config
;;   (persp-mode)) ;; TODO came up with some better keybindings

(use-package all-the-icons-dired
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package restclient)

(winner-mode 1)

;; TODO mu4e, undo-tree

;; TODO move this function into the self directory

(bind-key "C-c ," 'self/open-config-file)

(global-subword-mode t)

(blink-cursor-mode 0)

;; (require 'astrologit-mode)
; TODO: make mode for jest
; TODO: make mode for sport scores
; TODO: make mode for displaying git annotations on current line a la gitlens

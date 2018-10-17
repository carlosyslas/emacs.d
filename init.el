(package-initialize)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(defun load-file-if-exists (file-name)
  (let ((file-path (expand-file-name file-name user-emacs-directory)))
    (when (file-exists-p file-path)
      (load-file file-path))))
(load-file-if-exists "custom.el")

(add-to-list 'load-path "~/.emacs.d/self")
(require 'common)
(require 'programing)

(org-babel-load-file (expand-file-name "README.org" user-emacs-directory))

(eval-when-compile
  (require 'use-package))

(use-package evil
  :ensure t
  :config
  (evil-mode))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (recentf-mode 1))

(use-package ag
  :ensure t)

(use-package winnow
  :ensure t
  :config
  (add-hook 'ag-mode-hook 'winnow-mode))

(use-package helm-projectile
  :ensure t
  :config
  (global-set-key (kbd "M-p") 'helm-projectile-switch-project)
  (global-set-key (kbd "M-o") 'helm-projectile-find-file)
  (global-set-key (kbd "M-F") 'projectile-ag)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-f") 'helm-find-files)
  (global-set-key (kbd "C-<tab>") 'helm-buffers-list))

;; (use-package lsp-mode
;;   :ensure t
;;   :config
;;   (require 'lsp-imenu)
;;   (add-hook 'lsp-after-open-hook 'lsp-enable-imenu))

;; (use-package lsp-javascript-flow
;;   :ensure t)

(use-package js2-refactor
  :ensure t)

(use-package xref-js2
  :ensure t)

(use-package prettier-js
  :ensure t)

(use-package rjsx-mode
  :ensure t
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

;; Add syntax highlighting to jest snapshots
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.snap$" . web-mode)))

(use-package flycheck-flow
  :ensure t
  )

(use-package go-mode
  :ensure t)

(use-package indium
  :ensure t)

;;* Org mode
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(bind-key "M-a" 'org-agenda)

(use-package ace-window
  :ensure t
  :bind (("M-j" . ace-window)
         ("M-k" . ace-delete-window))
  :config
  (setq aw-keys '(?g ?c ?r ?h ?t ?n ?m ?w ?v)))

(use-package git-gutter-fringe+
  :ensure t
  :config
  (global-git-gutter+-mode)
  (setq-default fringes-outside-margins t)
  (fringe-helper-define 'git-gutter-fr+-added nil
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX.....")
  (fringe-helper-define 'git-gutter-fr+-modified nil
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    "XXX....."
    )
  (fringe-helper-define 'git-gutter-fr+-deleted nil
    "........"
    "........"
    "........"
    "........"
    "........"
    "........"
    "........"
    "........"
    "........"
    "........"
    "........"
    "........"
    "........"
    "X......."
    "XX......"
    "XXX....."
    "XXXX...."))

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode))

(use-package flx
  :ensure t)

(use-package company-flx
  :ensure t)

(use-package helm
  :ensure t
  :config
  (require 'helm-config))

(use-package avy
  :ensure t
  :bind (("M-s" . avy-goto-word-1)))

(use-package bind-key
  :ensure t)

;;* Dired config
(require 'dired)
(bind-key "M-0" 'dired-jump)
(setq dired-listing-switches "-ah")
(use-package dired-narrow
  :ensure t)

(use-package dired-sidebar
  :ensure t
  ;;:bind (("M-0" . dired-sidebar-toggle-sidebar))
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode)))
            )
  :config
  (setq dired-sidebar-theme 'vscode))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "M-e") 'er/expand-region))

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config))

(use-package paradox
  :ensure t)

(use-package nlinum
  :ensure t
  :config
  (setq nlinum-highlight-current-line t)) ;; TODO: Not sure yet

;; Perspective mode is not working well with desktop-save-mode
;; (use-package perspective
;;   :ensure t
;;   :config
;;   (persp-mode)) ;; TODO came up with some better keybindings

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package all-the-icons-dired
  :ensure t
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package restclient
  :ensure t)

(winner-mode 1)

;; TODO mu4e, undo-tree

;; TODO move this function into the self directory
(defun self/open-config-file ()
  "Opens my configuration file"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun self/camel-to-lisp-case (string)
  "Transform from CamelCase to lisp-case"
  (let ((case-fold-search nil))
    (downcase
     (replace-regexp-in-string
      "^-"
      ""
      (replace-regexp-in-string "\\([A-Z]\\)" "-\\1" string)))))

(global-set-key (kbd "M-,") 'self/open-config-file)

(global-set-key (kbd "C-x t") 'eshell)
(setq eshell-glob-case-insensitive t)
(setq eshell-cmpl-ignore-case t)

(global-subword-mode t)

(blink-cursor-mode 0)

;; Save and restore the session
(desktop-save-mode 1)

;; (require 'astrologit-mode)
; TODO: make mode for jest
; TODO: make mode for sport scores
; TODO: make mode for displaying git annotations on current line a la gitlens

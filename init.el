(package-initialize)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(defun load-file-if-exists (file-name)
  (let ((file-path (expand-file-name file-name user-emacs-directory)))
    (when (file-exists-p file-path)
      (load-file file-path))))
(load-file-if-exists "custom.el")

(add-to-list 'load-path "~/.emacs.d/self")
(require 'package-manager)
(require 'common)
(require 'programing)

(eval-when-compile
  (require 'use-package))

(use-package evil
  :ensure t
  :config
  (evil-mode))

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "M-g") 'magit-status))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (recentf-mode 1))

(use-package helm-projectile
  :ensure t
  :config
  (global-set-key (kbd "M-p") 'helm-projectile-switch-project)
  (global-set-key (kbd "M-o") 'helm-projectile-find-file)
  (global-set-key (kbd "M-F") 'projectile-grep)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-f") 'helm-find-files)
  (global-set-key (kbd "C-<tab>") 'helm-buffers-list))

(use-package rjsx-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode)))

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-j") 'ace-window)
  (global-set-key (kbd "M-k") 'ace-delete-window)
  (setq aw-keys '(?g ?c ?r ?h ?t ?n ?m ?w ?v)))

(use-package git-gutter-fringe+
  :ensure t
  :config
  (global-git-gutter+-mode)
  (setq-default fringes-outside-margins t)
  ;;(git-gutter-fr+-minimal)
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

(use-package treemacs
  :ensure t
  :bind (("M-0" . treemacs-select-window)))

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

(use-package paradox
  :ensure t)

(use-package nlinum
  :ensure t
  :config
  (setq nlinum-highlight-current-line t)) ;; TODO: Not sure yet

(use-package perspective
  :ensure t
  :config
  (persp-mode)) ;; TODO came up with some better keybindings

(use-package golden-ratio
  :ensure t
  :config
  (golden-ratio-mode 1))

(winner-mode 1)

;; TODO mu4e, undo-tree

;; TODO move this function into the self directory
(defun self/open-config-file ()
  "Opens my configuration file"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "M-,") 'self/open-config-file)

(global-set-key (kbd "C-x t") 'eshell)

(global-subword-mode t)

(blink-cursor-mode 0)

;; Theme
(set-face-attribute 'default nil :height 130)
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one))
(set-default-font "Source Code Pro")

;; (require 'astrologit-mode)
; TODO: make mode for jest
; TODO: make mode for sport scores
; TODO: make mode for displaying git annotations on current line a la gitlens

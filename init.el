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

(use-package counsel-projectile
  :ensure t
  :config
  (global-set-key (kbd "M-p") 'counsel-projectile-switch-project)
  (global-set-key (kbd "M-o") 'counsel-projectile-find-file))

(use-package js2-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)))

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-j") 'ace-window)
  (setq aw-keys '(?g ?c ?r ?h ?t ?n ?m ?w ?v)))

(use-package git-gutter-fringe+
  :ensure t
  :config
  (global-git-gutter+-mode)
  (git-gutter-fr+-minimal))

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode))

(use-package ivy
  :ensure t
  :config
  (ivy-mode)
  (setq ivy-re-builders-alist '((swiper . ivy--regex-plus) (t . ivy--regex-fuzzy))))

(use-package avy
  :ensure t
  :bind (("M-s" . avy-goto-word-1)))

;; TODO mu4e, undo-tree

;; TODO move this function into the self directory
(defun self/open-config-file ()
  "Opens my configuration file"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "M-,") 'self/open-config-file)


(global-set-key (kbd "M-f") 'find-file)

(global-set-key (kbd "C-x t") 'eshell)

(global-set-key (kbd "C-<tab>") 'switch-to-buffer)

;; Theme
(set-face-attribute 'default nil :height 130)
(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-harmonic-light t)
  (set-face-background 'fringe "#f7f9fb")
  (set-face-foreground 'vertical-border "#e5ebf1"))
(set-default-font "Source Code Pro")

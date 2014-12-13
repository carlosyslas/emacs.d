;; Stupid sound
;;(setq visible-bell t)

;; Hides warning --Not sure what id does now
(eval-after-load "bytecomp"
  '(add-to-list 'byte-compile-not-obsolete-vars
		'font-lock-beginning-of-syntax-function))

;;Temp files
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Stupid warnings gone
;(setq warning-minimum-level :error)

;; Scratch message
;(setq initial-scratch-message nil)

;; Hide startup message
;;(setq inhibit-startup-message t)
;; Use y or n instead of yes or no
(fset 'yes-or-no-p 'y-or-n-p)
;; Hide menu bar
;(menu-bar-mode -1)

;; Hide toolbar
;; (if (boundp 'tool-bar-mode)
;    (tool-bar-mode -1))
;; Hide scrollbar
;; (if (boundp 'scroll-bar-mode)
;;     (scroll-bar-mode -1))

;; Replace region
(pending-delete-mode t)

;; Enable ido-mode by default
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode 1)
;; (global-set-key
;;  "\M-x"
;;  (lambda ()
;;    (interactive)
;;    (call-interactively
;;     (intern
;;      (ido-completing-read
;;       "M-x "
;;       (all-completions "" obarray 'commandp)))))


;; Disable transient-mark-mode
(transient-mark-mode nil)

;; Subword-mode --Not sure if it's working
(setq global-subword-mode t)

;;;; Develpment
;; Show matching parentesis
(show-paren-mode t)

;;Linum
(add-hook 'find-file-hook (lambda () (linum-mode 1)))
(global-linum-mode 1)

;;hl line mode
(global-hl-line-mode)

;; Switch to previous buffer with c-tab
(defun switch-to-previous-buffer ()
      (interactive)
      (switch-to-buffer (other-buffer (current-buffer) 1)))

(global-set-key (kbd "C-<tab>") 'switch-to-previous-buffer)

(provide 'setup-misc)
;; End of setup-misc.el

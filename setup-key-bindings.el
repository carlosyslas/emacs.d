;; Should move to a different file: Taken from Magnars Sveen config
(defun kill-region-or-backward-word ()
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))


;; GoTo line
(global-set-key (kbd "C-x g") 'goto-line)

;; A more comfortable backspace
(global-unset-key (kbd "C-h"))
(global-set-key (kbd "C-h") 'backward-delete-char)
(global-set-key (kbd "M-h") 'kill-region-or-backward-word)

;; A better M-x
(global-set-key (kbd "C-x m") 'smex)
(global-set-key (kbd "C-c m") 'smex)

;; Multi-term
(global-set-key (kbd "C-x t") 'multi-term-next) ;; May change it?
;; (global-set-key (kbd "C-x t") 'eshell) Should check which to use

;; Previeous window
(global-set-key (kbd "C-x M-o") 'previous-multiframe-window)

;; Goto line
(global-set-key (kbd "C-x g") 'goto-line)

;; Org-mode
(global-set-key (kbd "<f2>") 'org-capture)

(provide 'setup-key-bindings)

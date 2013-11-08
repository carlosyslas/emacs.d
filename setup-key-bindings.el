;; Should move to a different file: Taken from Magnars Sveen config
(defun kill-region-or-backward-word ()
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))


;; A more comfortable backspace
(global-unset-key (kbd "C-h"))
(global-set-key (kbd "C-h") 'backward-delete-char)
(global-set-key (kbd "M-h") 'kill-region-or-backward-word)

;; A better M-x
(global-set-key (kbd "C-x m") 'smex)

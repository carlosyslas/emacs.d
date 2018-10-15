(setq self/indentation-spaces 2)

(global-subword-mode)

(show-paren-mode t)

(global-hl-line-mode)

(setq js2-basic-offset self/indentation-spaces)
(setq js2-bounce-indent-p nil)
(setq js-indent-level self/indentation-spaces
      indent-tabs-mode nil
      c-basic-offset self/indentation-spaces)
(setq css-indent-offset self/indentation-spaces)
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq python-indent-offset self/indentation-spaces)
(setq sgml-basic-offset self/indentation-spaces)

(defun self/is-spec-file ()
  (string-match-p "\\.spec" (buffer-file-name (current-buffer))))

(defun self/find-src-file ()
  (message "finding: src")
    (find-file (replace-regexp-in-string "__tests__/" ""
    (replace-regexp-in-string "\\.spec\\.js" ".js" (buffer-file-name (current-buffer))))))

(defun self/find-spec-file ()
  (message "finding: src")
  (find-file (let ((fn (buffer-file-name (current-buffer))))
    (format "%s__tests__/%s" (file-name-directory fn)
            (replace-regexp-in-string "\\.js" ".spec.js" (file-name-nondirectory fn))))))

(defun self/toggle-spec-file ()
  (interactive)
  (if (self/is-spec-file)
      (self/find-src-file)
    (self/find-spec-file)))

(bind-key "M-9" 'self/toggle-spec-file)

(provide 'programing)

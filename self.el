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

(provide 'self)

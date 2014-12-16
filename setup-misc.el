;; Stupid sound
;;(setq visible-bell t)

;; Hides warning --Not sure what id does now
(eval-after-load "bytecomp"
  '(add-to-list 'byte-compile-not-obsolete-vars
		'font-lock-beginning-of-syntax-function))

(provide 'setup-misc)
;; End of setup-misc.el

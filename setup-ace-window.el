;; #setup-ace-window
;;
;; ##Define key bindings
;; M-j ace-jump
;; 
;; ##Undefine key bindings
;; C-x o

(defun c-x-o-replace ()
  "Forces me to use ace-window"
  (interactive)
  (message "You better use M-j"))
(global-unset-key (kbd "C-x o"))
(global-set-key (kbd "C-x o") 'c-x-o-replace)

(global-set-key (kbd "M-j") 'ace-window)
(setq aw-keys '(?g ?c ?r ?h ?t ?n ?m ?w ?v))

(provide 'setup-ace-window)

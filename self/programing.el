(setq self/indentation-spaces 4)

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

(provide 'programing)

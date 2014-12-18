;; (add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-ipython-notebook/lisp/")
;; (require 'ein)
(add-hook 'ein:connect-mode-hook 'jedi:setup)
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)

(provide 'init-ein)

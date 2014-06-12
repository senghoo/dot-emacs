
(add-to-list 'auto-mode-alist '("\\.wsgi\\'" . python-mode))
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'jedi-mode-hook 'jedi-direx:setup)

(eval-after-load "python"
    '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))

(setq jedi:complete-on-dot t)                 ; optional


(provide 'init-lang-python)

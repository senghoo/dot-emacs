(evil-mode 1)
(setq evil-default-state 'emacs)
(define-key evil-emacs-state-map (kbd "C-\\") 'evil-execute-in-normal-state)
(provide 'init-evil)


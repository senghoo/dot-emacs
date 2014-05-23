(projectile-global-mode 1)
(setq projectile-switch-project-action 'helm-projectile)
(define-key projectile-mode-map (kbd "C-c p f") 'helm-projectile)
(provide 'init-projectile)

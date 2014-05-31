(projectile-global-mode 1)
(setq projectile-switch-project-action 'helm-projectile)
(define-key projectile-mode-map (kbd "C-c p f") 'helm-projectile)
(global-set-key (kbd "C-t") 'helm-projectile-all)

(provide 'init-projectile)

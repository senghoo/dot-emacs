(projectile-global-mode 1)
(setq projectile-switch-project-action 'helm-projectile)
(define-key projectile-mode-map (kbd "C-c p f") 'helm-projectile)
(define-key projectile-mode-map (kbd "C-c p p") 'helm-projectile-switch-project)
(setq helm-projectile-sources-list
      '(helm-source-projectile-files-list
        helm-source-projectile-projects
        helm-source-projectile-buffers-list
        helm-source-projectile-recentf-list))
(provide 'init-projectile)

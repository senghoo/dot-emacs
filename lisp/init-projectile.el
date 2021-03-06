(projectile-global-mode 1)
;; (setq projectile-switch-project-action 'helm-projectile)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq helm-projectile-sources-list
      '(helm-source-projectile-files-list
        helm-source-projectile-projects
        helm-source-projectile-buffers-list
        helm-source-projectile-recentf-list))

(defun projectile-helm-ag ()
  (interactive)
  (helm-ag (projectile-project-root)))


(define-key projectile-mode-map (kbd "C-c p f") 'helm-projectile)
(define-key projectile-mode-map (kbd "C-c p p") 'helm-projectile-switch-project)
(define-key projectile-mode-map (kbd "C-c p s a") 'projectile-helm-ag)
(provide 'init-projectile)

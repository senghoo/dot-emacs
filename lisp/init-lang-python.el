(add-to-list 'auto-mode-alist '("\\.wsgi\\'" . python-mode))

(eval-after-load "python"
  '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))


(defun jedi-config:server-setup ()
  (require 'pyvenv)
  (let ((cmds)
        (args))
    (if (ignore-errors (member (projectile-project-name) (pyvenv-virtualenv-list)))
        (setq args (append args `("--virtual-env" ,(expand-file-name (projectile-project-name) "~/.virtualenvs/")))))
    (when cmds (set (make-local-variable 'jedi:server-command) cmds))
    (when args (set (make-local-variable 'jedi:server-args) args))))



(defun jedi-config:setup-keys ()
  (jedi:setup)
  (setq jedi:complete-on-dot t)
  (local-set-key (kbd "M-.") 'jedi:goto-definition)
  (local-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker)
  (local-set-key (kbd "M-?") 'jedi:show-doc)
  (local-set-key (kbd "M-/") 'jedi:get-in-function-call))


(add-hook 'python-mode-hook 'jedi-config:setup-keys)
(add-hook 'python-mode-hook 'jedi-config:server-setup)
(add-hook 'jedi-mode-hook 'jedi-direx:setup)



(provide 'init-lang-python)

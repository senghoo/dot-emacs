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

;; jedi setup

(require 'jedi)
(defun jedi-config:setup ()
  (local-set-key (kbd "M-.") 'jedi:goto-definition)
  (local-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker)
  (local-set-key (kbd "M-?") 'jedi:show-doc)
  (local-set-key (kbd "M-'") 'jedi:get-in-function-call)
  (local-set-key (kbd "M-/") 'helm-jedi-related-names))

(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi-config:server-setup)
(add-hook 'python-mode-hook 'jedi-config:setup)
(add-hook 'jedi-mode-hook 'jedi-direx:setup)

;; jedi
(setq jedi:complete-on-dot t)
(setq jedi:install-imenu t)
(setq jedi:tooltip-method '(popup))


;; ipython
(when (executable-find "ipython")
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args ""
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
   python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))

(provide 'init-lang-python)

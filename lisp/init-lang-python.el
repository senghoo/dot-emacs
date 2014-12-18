(add-to-list 'auto-mode-alist '("\\.wsgi\\'" . python-mode))

(eval-after-load "python"
  '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))


;; jedi setup

(require 'jedi)
(defun jedi-config:setup ()
  ;; face
  (set-face-attribute 'jedi:highlight-function-argument t :foreground "Blue")
  (local-set-key (kbd "M-.") 'jedi:goto-definition)
  (local-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker)
  (local-set-key (kbd "M-?") 'jedi:show-doc)
  (local-set-key (kbd "M-'") 'jedi:get-in-function-call)
  (local-set-key (kbd "M-/") 'helm-jedi-related-names))

(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi-config:setup)
(add-hook 'jedi-mode-hook 'jedi-direx:setup)

;; jedi
(setq jedi:complete-on-dot t)
(setq jedi:install-imenu t)
(setq jedi:tooltip-method nil)



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

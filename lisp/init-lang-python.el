(elpy-enable)
(setq-default flycheck-flake8-maximum-line-length 120)
(setq-default elpy-modules (delete 'elpy-module-flymake elpy-modules))
(defun my-elpy-mode-config ()
  (setq company-backends (cons '(elpy-company-backend company-yasnippet company-dabbrev-code)
                               (delq 'elpy-company-backend
                                     (mapcar #'identity company-backend))))
  (define-key elpy-mode-map (kbd "C-M-n") 'elpy-nav-forward-block)
  (define-key elpy-mode-map (kbd "C-M-p") 'elpy-nav-backward-block)
  (define-key elpy-mode-map (kbd "M-?") 'elpy-doc)
  (define-key elpy-mode-map (kbd "C-c C-j") 'helm-imenu))

(add-hook 'elpy-mode-hook 'my-elpy-mode-config)

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

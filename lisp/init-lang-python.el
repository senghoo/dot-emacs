(pyenv-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)
(defun my-anaconda-mode ()
  (fci-mode)
  (setq fci-rule-column 80)
  (evil-leader/set-key-for-mode 'python-mode
    "." 'anaconda-mode-goto-definitions
    "*" 'anaconda-nav-pop-marker
    "?" 'anaconda-mode-view-doc
    "r" 'anaconda-mode-usages)
  (add-to-list 'company-backends 'company-anaconda))
(add-hook 'anaconda-mode-hook 'my-anaconda-mode)
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

(defun projectile-pyenv-mode-set ()
  "Set pyenv version matching project name.
Version must be already installed."
  (pyenv-mode-set (projectile-project-name)))

(add-hook 'projectile-switch-project-hook 'projectile-pyenv-mode-set)
(provide 'init-lang-python)

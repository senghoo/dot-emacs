(pyenv-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)

(defun anaconda-mode-goto-definitions-or-assignments ()
  (interactive)
  (anaconda-nav-navigate
   (or (anaconda-mode-call "goto_definitions")
       (anaconda-mode-call "goto_assignments")
       (error "No assignment found"))
   t))

(defun my-anaconda-mode ()
  (fci-mode)
  (setq fci-rule-column 80)
  (evil-leader/set-key-for-mode 'python-mode
    ",." 'anaconda-mode-goto-definitions-or-assignments
    ",," 'anaconda-nav-pop-marker
    ",?" 'anaconda-mode-view-doc
    ",/" 'anaconda-mode-usages)
  (add-to-list 'company-backends 'company-anaconda)
  (highlight-indentation-mode)
  (my-gtag-mode)
  (setq imenu-create-index-function 'python-imenu-create-index))
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

(provide 'init-lang-python)

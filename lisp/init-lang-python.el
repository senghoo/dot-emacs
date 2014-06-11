(add-to-list 'auto-mode-alist '("\\.wsgi\\'" . python-mode))
(elpy-enable)
(elpy-use-ipython)
(define-key elpy-mode-map (kbd "C-c C-n") 'flycheck-tip-cycle)


(defun ac-elpy-mode-setup()
  (setq ac-sources '(ac-source-yasnippet
                     ac-source-elpy-dot
                     ac-source-elpy
                     ac-source-dictionary
                     ac-source-filename
                     ac-source-words-in-same-mode-buffers)))

(add-hook 'elpy-mode-hook 'ac-elpy-mode-setup)

(defun my-ac-elpy-mode()
  (setq elpy-rpc-backend "jedi"))

(add-hook 'elpy-mode-hook 'my-ac-elpy-mode)

(provide 'init-lang-python)

(defun my-company-mode-config ()
  (setq-default company-idle-delay .1)
  (setq-default company-minimum-prefix-length 2)
  (setq-default company-auto-complete t)
  (global-key-binding (kbd "<C-tab>") 'company-manual-begin)
  (define-key company-mode-map (kbd "C-c C-y") 'company-yasnippet)
  (define-key company-active-map [tab] 'company-select-next)
  (define-key company-active-map (kbd "TAB") 'company-select-next)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(add-hook 'company-mode-hook 'my-company-mode-config)
(add-hook 'after-init-hook 'global-company-mode)


;; theme

;; yasnippet


(provide 'init-company)

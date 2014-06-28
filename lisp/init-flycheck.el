(add-hook 'after-init-hook 'global-flycheck-mode)

(defun my-flycheck-mode-hook()
  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
        flycheck-tip-avoid-show-func nil
        flycheck-idle-change-delay 0.8
        flycheck-display-errors-function 'flycheck-clippy-show-error-messages
        flycheck-flake8-maximum-line-length 120))

(add-hook 'flycheck-mode-hook 'my-flycheck-mode-hook)

(defun flycheck-clippy-show-error-messages (errors)
  (-when-let (msg (mapconcat 'identity (-keep #'flycheck-error-message errors) "\n"))
    (if (popup-live-p ac-menu)
        (message  msg )
        (clippy-say msg))))

(provide 'init-flycheck)

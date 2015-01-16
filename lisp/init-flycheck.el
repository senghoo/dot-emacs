(add-hook 'after-init-hook 'global-flycheck-mode)

(defun my-flycheck-mode-hook()
  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
        flycheck-idle-change-delay 1
        flycheck-display-errors-function 'flycheck-clippy-show-error-messages
        flycheck-indication-mode nil
        flycheck-flake8-maximum-line-length 120))


(add-hook 'flycheck-mode-hook 'my-flycheck-mode-hook)

(defun flycheck-clippy-show-error-messages (errors)
  (-when-let (msg (mapconcat 'identity (-keep #'flycheck-error-message errors)
                             "\n\n"))
    (clippy-say msg (- (min (- (window-body-width) (current-column)) 80) 15))))


(provide 'init-flycheck)

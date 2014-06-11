(add-hook 'after-init-hook 'global-flycheck-mode)

;; Override default flycheck triggers


(defun my-flycheck-mode-hook()
  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
        flycheck-tip-avoid-show-func nil
        flycheck-idle-change-delay 0.8
        flycheck-display-errors-function 'flycheck-clippy-show-error-messages))

(add-hook 'flycheck-mode-hook 'my-flycheck-mode-hook)

(defun flycheck-clippy-show-error-messages (errors)
  (-when-let (messages (-keep #'flycheck-error-message errors))
    (clippy-say
     (mapconcat 'identity messages "\n"))))

(provide 'init-flycheck)

(add-hook 'after-init-hook 'global-flycheck-mode)

;; Override default flycheck triggers
(setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
      flycheck-tip-avoid-show-func nil
      flycheck-idle-change-delay 0.8)
(global-set-key (kbd "C-c C-n") 'flycheck-tip-cycle)
;; (eval-after-load 'flycheck
;;   '(custom-set-variables
;;    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
(provide 'init-flycheck)

(defun my-php-setup ()
  (define-key php-mode-map [tab] 'ac-trigger-key-command))
(add-hook 'php-mode-hook 'my-php-setup)
(provide 'init-lang-php)

(defun-add-hook 'php-mode-hook
  (setq flycheck-phpcs-standard "PSR2"
        phpcbf-standard "PSR2"
        indent-tabs-mode nil
        tab-width 4
        c-basic-offset 4
        flycheck-checker-error-threshold nil
        imenu-create-index-function 'imenu-default-create-index-function
        company-backends '((php-extras-company company-keywords company-dabbrev-code)))
  (set (make-local-variable 'eldoc-documentation-function)
       #'php-extras-eldoc-documentation-function))
(provide 'init-lang-php)

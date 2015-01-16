;;; multi-web-mode
;; (setq mweb-default-major-mode 'html-mode)
;; (setq mweb-tags '((js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
;;                   (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
;; (setq mweb-filename-extensions '("htm" "html"))
;; (multi-web-global-mode 1)
;; (define-key mweb-mode-map (kbd "M-<f11>") nil)
;; (define-key mweb-mode-map (kbd "M-<f12>") nil)


;; web-mode
(defun my-web-mode-alist()
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode)))


(defun my-web-mode-hook()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))



(my-web-mode-alist)
(add-hook 'web-mode-hook  'my-web-mode-hook)

(provide 'init-lang-html)

;; web-mode
(defun my-web-mode-alist()
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode)))


(defun my-web-mode-hook()
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4))



(my-web-mode-alist)
(add-hook 'web-mode-hook  'my-web-mode-hook)

(provide 'init-lang-html)

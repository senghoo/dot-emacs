(require 'theme-senghoo)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'rainbow-delimiters-mode-hook #'theme-senghoo-color)
(powerline-senghoo-theme)
(provide 'init-theme)

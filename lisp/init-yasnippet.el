(require 'yasnippet)
(yas-global-mode t)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
(require 'dropdown-list)
(setq yas-prompt-functions '(yas-dropdown-prompt
                             yas-ido-prompt
                             yas-completing-prompt))
(provide 'init-yasnippet)

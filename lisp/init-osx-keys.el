(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
(setq default-input-method "MacOSX")
(define-key key-translation-map "\e[21~" [f10])
;; Make mouse wheel / trackpad scrolling less jerky
(setq mouse-wheel-scroll-amount '(1
				  ((shift) . 5)
				  ((control))))

(provide 'init-osx-keys)

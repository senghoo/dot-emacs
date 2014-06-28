(when (eq system-type 'darwin)
  ;; default Latin font (e.g. Consolas)
  (set-face-attribute 'default nil :family "Monaco")
    (set-fontset-font t 'han (font-spec :family "STHeiti" :size 12)))

(provide 'init-fonts)

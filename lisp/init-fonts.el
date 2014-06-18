
(if (fboundp 'set-fontset-font)
    (set-fontset-font t 'han (font-spec :family "STHeiti" :size 12)))
(provide 'init-fonts)

(require 'color)

(defface powerline-senghoo-1
  '((t (:inherit mode-line :background "#afd700" :foreground "#005f00")))
  "Powerline face 1."
  :group 'theme-senghoo)

(defface powerline-senghoo-2
  '((t (:background "#005f87" :foreground "#e4e4e4" :inherit mode-line)))
  "Powerline face 1."
  :group 'theme-senghoo)

(defface powerline-senghoo-3
  '((t (:inherit mode-line :background "gray15")))
  "Powerline face 1."
  :group 'theme-senghoo)

(defface powerline-senghoo-4
  '((t (:inherit mode-line :background "gray30")))
  "Powerline face 1."
  :group 'theme-senghoo)

(defface powerline-senghoo-5
  '((t (:inherit mode-line :background "grey60" :foreground "grey19")))
  "Powerline face 1."
  :group 'theme-senghoo)

(defface powerline-senghoo-6
  '((t (:inherit mode-line :background "gray82" :foreground "gray19")))
  "Powerline face 1."
  :group 'theme-senghoo)

(defface powerline-senghoo-7
  '((t (:background "grey22" :inherit mode-line)))
  "Powerline face 1."
  :group 'theme-senghoo)

(require 'powerline)
(require 'nyan-mode)


(defun powerline-senghoo-theme ()
  "Setup the default mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-raw "%*" 'powerline-senghoo-1 'l)
                                     ;; (powerline-raw evil-mode-line-tag 'powerline-senghoo-1 'l)
                                     ;; (powerline-raw
                                     ;;  (eval (evil-state-property evil-state :name))
                                     ;;  'powerline-senghoo-1 'l)
                                     (powerline-major-mode 'powerline-senghoo-1 'l)
                                     (powerline-raw " " 'powerline-senghoo-1 'l)
                                     (powerline-raw "%b " 'powerline-senghoo-2 'l)
                                     (powerline-vc 'powerline-senghoo-3 'l)
                                     (powerline-raw " " 'powerline-senghoo-3 'l)
                                     (nyan-create)))
                          (rhs (list
                                     (powerline-process 'powerline-senghoo-4 'l)
                                     (powerline-raw " %3p of %I" 'powerline-senghoo-5 'l)
                                     (powerline-raw "%3l" 'powerline-senghoo-6 'l)
                                     (powerline-raw ":" 'powerline-senghoo-6 'l)
                                     (powerline-raw "%3c" 'powerline-senghoo-6 'r)
                                     (powerline-raw " " 'powerline-senghoo-7 'l)
                                     )))
                     (concat (powerline-render lhs)
                             (powerline-fill 'powerline-senghoo-3 (powerline-width rhs))
                             (powerline-render rhs)))))))

(defun theme-senghoo-color()
  (set-face-attribute 'rainbow-delimiters-depth-1-face nil :foreground "#c5c8c6")
  (set-face-attribute 'rainbow-delimiters-depth-2-face nil :foreground "#8abeb7")
  (set-face-attribute 'rainbow-delimiters-depth-3-face nil :foreground "#f0c674")
  (set-face-attribute 'rainbow-delimiters-depth-4-face nil :foreground "VioletRed2")
  (set-face-attribute 'rainbow-delimiters-depth-5-face nil :foreground "Brown")
  (set-face-attribute 'rainbow-delimiters-depth-6-face nil :foreground "cyan1")
  (set-face-attribute 'rainbow-delimiters-depth-7-face nil :foreground "#8abeb7")
  (set-face-attribute 'rainbow-delimiters-depth-8-face nil :foreground "#f0c674")
  (set-face-attribute 'rainbow-delimiters-depth-9-face nil :foreground "#b5bd68")
  (set-face-attribute 'rainbow-delimiters-unmatched-face nil  :foreground "black" :background "red")
  (let ((bg "#1d1f21"))
    (custom-set-faces
     `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
     `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
     `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
     `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
     `(company-tooltip-common ((t (:inherit font-lock-constant-face)))))))
(provide 'theme-senghoo)

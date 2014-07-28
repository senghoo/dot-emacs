(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "C-1") 'speedbar)
(global-set-key (kbd "C-2") 'set-mark-command)
(global-set-key (kbd "C-3") 'youdao-dict)
(global-set-key (kbd "C-#") 'youdao-dict-detail)

(global-set-key (kbd "<f1> <f1>") 'discover-my-major)

;; popwin 
;; (when (require 'popwin nil t)
;;   (popwin-mode 1)
;;   (setq display-buffer-function 'popwin:display-buffer)
;;   ;; (push '("^\*anything .+\*$" :regexp t :height 20) popwin:special-display-config)
;;   ;; (push '("^\*helm .+\*$" :regexp t :height 20) popwin:special-display-config)
;;   (push '("*Helm Find Files*" :height 20) popwin:special-display-config)
;;   (push '("*helm buffers*" :height 20) popwin:special-display-config)
;;   (push '("*helm projectile all*" :height 20) popwin:special-display-config)
;;   (push '("*helm*" :height 20) popwin:special-display-config)
;;   (push '("*helm M-x*" :height 20) popwin:special-display-config)
;;   (push '("*Warnings*" :height 20) popwin:special-display-config)
;;   (push '("*Procces List*" :height 20) popwin:special-display-config)
;;   (push '("*Messages*" :height 20) popwin:special-display-config)
;;   (push '("*Backtrace*" :height 20) popwin:special-display-config)
;;   (push '("*Compile-Log*" :height 20 :noselect t) popwin:special-display-config)
;;   (push '("*Remember*" :height 20) popwin:special-display-config)
;;   (push '("*undo-tree*" :height 20) popwin:special-display-config)
;;   (push '("*All*" :height 20) popwin:special-display-config)
;;   ;; direx
;;   (push '(direx:direx-mode :position left :width 40 :dedicated t)
;;         popwin:special-display-config))



(provide 'init-misc)


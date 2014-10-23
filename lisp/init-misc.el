(fset 'yes-or-no-p 'y-or-n-p)



(defun toggle-minor-mode-head-line ()
  (interactive)
  (if header-line-format
      (setq header-line-format nil)
    (setq header-line-format '("%e" (:eval
                                     (let* ((lhs
                                             (list
                                              (powerline-raw mode-line-buffer-identification 'powerline-senghoo-1)
                                              (powerline-raw mode-line-frame-identification 'powerline-senghoo-2)
                                              (powerline-minor-modes 'powerline-senghoo-2)))
                                            (rhs
                                             (list
                                              (powerline-raw "%z" 'powerline-senghoo-7)
                                              (powerline-raw " " 'powerline-senghoo-7 'l))))
                                       (concat (powerline-render lhs)
                                               (powerline-fill 'powerline-senghoo-3 (powerline-width rhs))
                                               (powerline-render rhs))))))))
(global-set-key (kbd "C-1") 'speedbar)
(global-set-key (kbd "C-2") 'set-mark-command)
(global-set-key (kbd "C-3") 'youdao-dict)
(global-set-key (kbd "C-#") 'youdao-dict-detail)

(global-set-key (kbd "<f1> <f1>") 'discover-my-major)
(global-set-key (kbd "<f1> <f2>") 'toggle-minor-mode-head-line)



(provide 'init-misc)


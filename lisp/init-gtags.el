(setq helm-gtags-ignore-case t
      helm-gtags-auto-update t
      helm-gtags-use-input-at-cursor t
      helm-gtags-pulse-at-cursor t
      helm-gtags-prefix-key "\C-cg"
      helm-gtags-suggested-key-mapping t)
(defun my-gtag-mode ()
  (ggtags-mode 1)
  (helm-gtags-mode)
  (setq-local imenu-create-index-function #'ggtags-build-imenu-index)
  (evil-leader/set-key
    "g." 'helm-gtags-dwim
    "g," 'helm-gtags-pop-stack
    "g/" 'helm-gtags-select))
(provide 'init-gtags)

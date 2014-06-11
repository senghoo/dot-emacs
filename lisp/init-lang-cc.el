(require 'auto-complete-clang)

(defun my-c-mode-common-hook ()
  ;; set my personal style for the current buffer
  ;; (c-set-style "gnu")
  ;; other customizations
  (setq tab-width 8
        default-tab-width 8
        indent-tabs-mode nil
        c-basic-offset 8
        c-default-style "k&r"
        c-electric-flag nil
        c-tab-always-indent nil
        c-insert-tab-function 'indent-for-tab-command)
  (c-toggle-auto-hungry-state 1)
  (c-toggle-auto-newline nil)
  (global-ede-mode ))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(setq compile-command "make")

;;; cscope
(cscope-setup)
(setq cscope-do-not-update-database t)
(setf c-header-paths
      '("/usr/include/"
        "/usr/local/include/"))

;; auto-complete

(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              c-header-paths))

(defun ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet ac-source-gtags) ac-sources)))

;; flycheck
(setq flycheck-clang-include-path c-header-paths)

(provide 'init-lang-cc)

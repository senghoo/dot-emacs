(require 'auto-complete-config)
(ac-config-default)
(setq-default ac-expand-on-auto-complete nil)
(setq-default ac-auto-start nil)
(setq-default ac-dwim t)
(ac-set-trigger-key "TAB")

(add-to-list 'completion-styles 'initials t)
(set-default 'ac-sources
             '(ac-source-abbrev
               ac-source-imenu
               ac-source-yasnippet
               ac-source-dictionary
               ac-source-filename
               ac-source-words-in-same-mode-buffers
               ))

(setq tab-always-indent 'complete)  ;; use 't when auto-complete is disabled

;; hook AC into completion-at-point
(defun sanityinc/auto-complete-at-point ()
  (when (and (not (minibufferp))
	     (fboundp 'auto-complete-mode)
	     auto-complete-mode)
    (auto-complete)))

(defun sanityinc/never-indent ()
  (set (make-local-variable 'indent-line-function) (lambda () 'noindent)))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions
        (cons 'sanityinc/auto-complete-at-point
              (remove 'sanityinc/auto-complete-at-point completion-at-point-functions))))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)




(dolist (mode '(magit-log-edit-mode
                log-edit-mode org-mode text-mode haml-mode
                git-commit-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode
                js3-mode css-mode less-css-mode sql-mode
                sql-interactive-mode
                inferior-emacs-lisp-mode))
  (add-to-list 'ac-modes mode))


;; Exclude very large buffers from dabbrev
(defun sanityinc/dabbrev-friend-buffer (other-buffer)
  (< (buffer-size other-buffer) (* 1 1024 1024)))
(setq dabbrev-friend-buffer-function 'sanityinc/dabbrev-friend-buffer)
(define-key ac-completing-map (kbd "M-RET") 'ac-complete)



(provide 'init-auto-complete)

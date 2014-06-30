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


(provide 'init-auto-complete)

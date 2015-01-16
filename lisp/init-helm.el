(require 'helm-config)
(require 'helm)
(helm-mode 1)
(set-face-attribute 'helm-ff-directory nil :foreground "white" :background "blue")
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-`") 'helm-locate)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-g l") 'helm-locate)
(global-set-key (kbd "M-g p") 'helm-do-grep)
(global-set-key (kbd "C-c C-j") 'helm-semantic-or-imenu)
(define-key helm-map (kbd "C-2") 'helm-toggle-visible-mark)
(define-key helm-map (kbd "C-j") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") 'helm-select-3rd-action)


(global-set-key (kbd "C-c h g") 'helm-google-suggest)
(global-set-key (kbd "C-c h r") 'helm-register)
(global-set-key (kbd "C-c h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-h b") 'helm-descbinds)
(helm-autoresize-mode t)


(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-M-x-fuzzy-match t
      helm-autoresize-max-height 30
      helm-locate-command "mdfind %s %s")

(provide 'init-helm)

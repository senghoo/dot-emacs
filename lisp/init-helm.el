(require 'helm-config)
(require 'helm)
(helm-mode 1)
(set-face-attribute 'helm-ff-directory nil :foreground "white" :background "blue")
(defun my-helm-mode-hook ()
  (local-set-key (kbd "C-x C-f") 'helm-find-files)
  (local-set-key (kbd "M-x") 'helm-M-x)
  (local-set-key (kbd "C-x b") 'helm-mini)
  (local-set-key (kbd "C-`") 'helm-locate)
  (local-set-key (kbd "M-y") 'helm-show-kill-ring)
  (local-set-key (kbd "M-g l") 'helm-locate)
  (local-set-key (kbd "M-g p") 'helm-do-grep)
  (local-set-key (kbd "C-c C-j") 'helm-semantic-or-imenu)
  (define-key helm-map (kbd "C-2") 'helm-toggle-visible-mark))

(add-hook 'helm-mode-hook 'my-helm-mode-hook)
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
      helm-locate-command "mdfind %s %s"
      helm-prevent-escaping-from-minibuffer t
      helm-bookmark-show-location t
      helm-display-header-line nil
      helm-split-window-in-side-p t
      helm-always-two-windows t
      helm-echo-input-in-header-line t)

;; fuzzy matching setting
(setq helm-M-x-fuzzy-match t
      helm-apropos-fuzzy-match t
      helm-file-cache-fuzzy-match t
      helm-imenu-fuzzy-match t
      helm-lisp-fuzzy-completion t
      helm-locate-fuzzy-match t
      helm-recentf-fuzzy-match t
      helm-semantic-fuzzy-match t
      helm-buffers-fuzzy-matching t)


(defun helm-hide-minibuffer-maybe ()
        (when (with-helm-buffer helm-echo-input-in-header-line)
          (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
            (overlay-put ov 'window (selected-window))
            (overlay-put ov 'face (let ((bg-color (face-background 'default nil)))
                                    `(:background ,bg-color :foreground ,bg-color)))
            (setq-local cursor-type nil))))
(add-hook 'helm-minibuffer-set-up-hook 'helm-hide-minibuffer-maybe)

(defun helm-find-files (arg)
  "Custom spacemacs implementation for calling helm-find-files-1.
Removes the automatic guessing of the initial value based on thing at point. "
  (interactive "P")
  (let* ((hist          (and arg helm-ff-history (helm-find-files-history)))
         (default-input hist )
         (input         (cond ((and (eq major-mode 'dired-mode) default-input)
                               (file-name-directory default-input))
                              ((and (not (string= default-input ""))
                                    default-input))
                              (t (expand-file-name (helm-current-directory))))))
    (set-text-properties 0 (length input) nil input)
    (helm-find-files-1 input )))


(provide 'init-helm)

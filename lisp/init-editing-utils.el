(require 'youdao-dict)


;;----------------------------------------------------------------------------
;; Some basic preferences
;;----------------------------------------------------------------------------
(setq-default
 blink-cursor-delay 0
 blink-cursor-interval 0.4
 bookmark-default-file (expand-file-name ".bookmarks.el" user-emacs-directory)
 buffers-menu-max-size 30
 case-fold-search t
 column-number-mode t
 compilation-scroll-output t
 delete-selection-mode t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 grep-highlight-matches t
 grep-scroll-output t
 indent-tabs-mode nil
 line-spacing 0.2
 make-backup-files nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 set-mark-command-repeat-pop t
 show-trailing-whitespace t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil)

(setq-default locate-command "mdfind")
(global-set-key (kbd "RET") 'newline-and-indent)
(global-undo-tree-mode)
(global-linum-mode)
(highlight-symbol-mode)
(global-hl-line-mode)
(setq-default initial-scratch-message
              (concat ";; Happy hacking Senghoo !\n\n"))
;;----------------------------------------------------------------------------
;; Handy key bindings
;;----------------------------------------------------------------------------

(global-unset-key (kbd "C-j"))
(global-unset-key (kbd "M-j"))
(local-unset-key (kbd "M-j"))
(local-unset-key (kbd "C-j"))
;; To be able to M-x without meta
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
;;expand region
(global-set-key (kbd "C-=") 'er/expand-region)
;; Vimmy alternatives to M-^ and C-u M-^
(global-set-key (kbd "C-c j") 'join-line)
(global-set-key (kbd "C-c J") (lambda () (interactive) (join-line 1)))
(global-set-key (kbd "C-x C-.") 'pop-global-mark)
(global-set-key (kbd "C-;") 'ace-jump-mode)
(global-set-key (kbd "M-j") 'ace-jump-mode)
;; multiple-cursors
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-+") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; From active region to multiple cursors:

(global-set-key (kbd "C-c c r") 'set-rectangular-region-anchor)
(global-set-key (kbd "C-c c c") 'mc/edit-lines)
(global-set-key (kbd "C-c c e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-c c a") 'mc/edit-beginnings-of-lines)

(global-set-key (kbd "C-x C-z") 'repeat)
(setq highlight-symbol-on-navigation-p t)
(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)

;; Train myself to use M-f and M-b instead
(global-unset-key [M-left])
(global-unset-key [M-right])
(global-unset-key (kbd "C-x z"))

;; visual regexp
(require 'visual-regexp-steroids)
(set-default 'vr/command-python (format "python %s" (expand-file-name "extra/scripts/regexp.py" user-emacs-directory)))
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
(define-key global-map (kbd "C-r") 'vr/isearch-backward)
(define-key global-map (kbd "C-s") 'vr/isearch-forward)
(define-key global-map (kbd "M-,") 'pop-tag-mark)
(global-set-key (kbd "C-c C-j") 'imenu)

;; to use visual-regexp-steroids's isearch instead of the built-in regexp isearch, also include the following lines:
(define-key esc-map (kbd "C-r") 'vr/isearch-backward) ;; C-M-r
(define-key esc-map (kbd "C-s") 'vr/isearch-forward) ;; C-M-s


(provide 'init-editing-utils)

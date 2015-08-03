;;; Find and load the correct package.el
(require 'package)


;;; Standard package repositories


;; We include the org repository for completeness, but don't normally
;; use it.
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;;; Also use Melpa for most packages
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; But don't take Melpa versions of certain packages
(setq package-filter-function
      (lambda (package version archive)
        (or (not (string-equal archive "melpa"))
            (not (memq package '())))))


;;; On-demand installation of packages
(require 'cl)
(defvar prelude-packages '(ace-jump-mode
                           color-theme
                           color-theme-sanityinc-tomorrow
                           dired+
                           direx
                           discover-my-major
                           exec-path-from-shell
                           expand-region
                           flycheck
                           fuzzy
                           helm
                           helm-flycheck
                           helm-projectile
                           helm-projectile-all
                           highlight-indentation
                           highlight-symbol
                           ibuffer-vc
                           magit
                           markdown-mode
                           markdown-mode+
                           multiple-cursors
                           popup
                           pos-tip
                           powerline
                           projectile
                           pyvenv
                           pyenv
                           pytest
                           rainbow-delimiters
                           slime
                           undo-tree
                           visual-regexp
                           visual-regexp-steroids
                           web-mode
                           wgrep
                           xcscope
                           yaml-mode
                           yasnippet
                           popwin
                           php-mode)

  "A list of packages to ensure are installed at launch.")


(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))


(package-initialize)
(unless (prelude-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p prelude-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; (defun no-proxy-advice (orig-fun)
;;     (let ((url-proxy-services nil))
;;        (funcall orig-fun)))

;; (advice-add 'paradox--refresh-star-count :around #'no-proxy-advice)


(provide 'init-elpa)


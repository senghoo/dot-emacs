;;; Find and load the correct package.el
(require 'package)


;;; Standard package repositories

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; We include the org repository for completeness, but don't normally
;; use it.
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;;; Also use Melpa for most packages
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;; But don't take Melpa versions of certain packages
(setq package-filter-function
      (lambda (package version archive)
        (or (not (string-equal archive "melpa"))
            (not (memq package '())))))


;;; On-demand installation of packages
(require 'cl)
(defvar prelude-packages '(ace-jump-mode
                           auto-complete
                           auto-complete-clang
                           auto-complete-clang-async
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
                           jedi
                           jedi-direx
                           magit
                           markdown-mode
                           markdown-mode+
                           multiple-cursors
                           popup
                           pos-tip
                           powerline
                           projectile
                           pyvenv
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
                           php-mode
                           php-extras)
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




(provide 'init-elpa)


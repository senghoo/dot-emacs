;; init.el --- emacs main config
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))


;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------

(require 'init-elpa)
(require 'init-env)
;; (require 'init-cedet)

;;----------------------------------------------------------------------------
;; Package config
;;----------------------------------------------------------------------------

;;basic editing
(require 'init-theme)
(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flycheck)
(require 'init-recentf)
(require 'init-misc)

;; (require 'init-ido)
(require 'init-helm)
(require 'init-fonts)
(require 'init-editing-utils)
(require 'init-projectile)
;; (require 'init-evil)
;;develop tools
(require 'init-git)
(require 'init-auto-complete)
(require 'init-yasnippet)
;;lang support
(require 'init-slime)
(require 'init-lang-python)
(require 'init-lang-cc)
(require 'init-lang-html)
(require 'init-lang-elisp)
;; some emacs toy
(require 'init-toy)

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))


(require 'cl)
;; Local Variables:
;; coding: utf-8
;; End:
;;; init.el ends here

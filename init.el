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
(require 'init-hydra)

;; (require 'init-ido)
(require 'init-helm)
(require 'init-fonts)
(require 'init-editing-utils)
(require 'init-projectile)
(require 'init-quickrun)
(require 'init-evil)
(require 'init-gtags)

;;develop tools
(require 'init-git)
(require 'init-company)
(require 'init-yasnippet)
(require 'init-prodigy)
(require 'init-ein)

;;lang support
(require 'init-slime)
(require 'init-lang-python)
(require 'init-lang-cc)
(require 'init-lang-html)
(require 'init-lang-elisp)
(require 'init-lang-php)
(require 'init-lang-go)

;; some emacs toy
(require 'init-toy)

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'load-directory)
(setq custom-dir (expand-file-name "custom" user-emacs-directory))
(if (file-accessible-directory-p custom-dir)
    (load-directory custom-dir))


(require 'cl)
;; Local Variables:
;; coding: utf-8
;; End:
;;; init.el ends here

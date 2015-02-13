;; evil module
(evil-mode 1)
(global-evil-leader-mode)
(global-evil-surround-mode 1)
(global-evil-matchit-mode 1)
(evil-exchange-install)
;; (evil-escape-mode)
(evil-jumper-mode)

;; evil configure
(defun spacemacs/state-color-face (state)
  "Return the symbol of the face for the given STATE."
  (intern (format "spacemacs-%s-face" (symbol-name state))))

(defun spacemacs/defface-state-color (state color)
  "Define a face for the given STATE and background COLOR."
  (eval `(defface ,(spacemacs/state-color-face state) '((t ()))
           ,(format "%s state face." (symbol-name state))
           :group 'spacemacs))
  (set-face-attribute (spacemacs/state-color-face state) nil
                      :background color
                      :foreground "black"
                      :box (face-attribute 'mode-line :box)
                      :inherit 'mode-line))

(defun spacemacs/state-color (state)
  "Return the color string associated to STATE."
  (face-background (spacemacs/state-color-face state)))

(defun spacemacs/current-state-color ()
  "Return the color string associated to the current state."
  (face-background (spacemacs/state-color-face evil-state)))

(defun spacemacs/state-face (state)
  "Return the face associated to the STATE."
  (spacemacs/state-color-face state))

(defun spacemacs/current-state-face ()
  "Return the face associated to the current state."
  (let ((state (if (eq evil-state 'operator)
                   evil-previous-state
                 evil-state)))
    (spacemacs/state-color-face state)))

(defun spacemacs/set-state-faces ()
  "Define or set the state faces."
  (mapcar (lambda (x) (spacemacs/defface-state-color (car x) (cdr x)))
          '((normal . "DarkGoldenrod2")
            (insert . "chartreuse3")
            (emacs  . "SkyBlue2")
            (visual . "gray")
            (motion . "plum3")
            (lisp   . "HotPink1"))))

(defun set-default-evil-emacs-state-cursor ()
  (setq evil-emacs-state-cursor `(,(spacemacs/state-color 'emacs) box)))

(defun set-default-evil-normal-state-cursor ()
  (setq evil-normal-state-cursor `(,(spacemacs/state-color 'normal) box)))

(defun set-default-evil-insert-state-cursor ()
  (setq evil-insert-state-cursor `(,(spacemacs/state-color 'insert) (bar . 2))))

(defun set-default-evil-visual-state-cursor ()
  (setq evil-visual-state-cursor `(,(spacemacs/state-color 'visual) (hbar . 2))))

(defun set-default-evil-motion-state-cursor ()
  (setq evil-motion-state-cursor `(,(spacemacs/state-color 'motion) box)))

(defun set-default-evil-lisp-state-cursor ()
  (setq evil-lisp-state-cursor `(,(spacemacs/state-color 'lisp) box)))

(defun evil-insert-state-cursor-hide ()
  (setq evil-insert-state-cursor `(,(spacemacs/state-color 'insert) (hbar . 0))))

(spacemacs/set-state-faces)
(set-default-evil-emacs-state-cursor)
(set-default-evil-normal-state-cursor)
(set-default-evil-insert-state-cursor)
(set-default-evil-visual-state-cursor)
(set-default-evil-motion-state-cursor)
(set-default-evil-lisp-state-cursor)

(add-to-list 'evil-emacs-state-modes 'anaconda-nav-mode)
(add-to-list 'evil-emacs-state-modes 'git-timemachine-mode)
(add-to-list 'evil-emacs-state-modes 'quickrun/mode)
(add-to-list 'evil-emacs-state-modes 'prodigy-mode)
(add-to-list 'evil-emacs-state-modes 'paradox-menu-mode)
(add-to-list 'evil-emacs-state-modes 'paradox-commit-list-mode)
(add-to-list 'evil-emacs-state-modes 'sx-question-list-mode)
(add-to-list 'evil-emacs-state-modes 'sx-question-mode)

(evil-mode 1)

(define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)
(define-key evil-normal-state-map (kbd "C-p") 'helm-show-kill-ring)
(define-key evil-normal-state-map (kbd "Q") 'evil-execute-macro)


;; evil-args
;; bind evil-args text objects
(define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)
;; bind evil-forward/backward-args
(define-key evil-normal-state-map "L" 'evil-forward-arg)
(define-key evil-normal-state-map "H" 'evil-backward-arg)
(define-key evil-motion-state-map "L" 'evil-forward-arg)
(define-key evil-motion-state-map "H" 'evil-backward-arg)
;; bind evil-jump-out-args
(define-key evil-normal-state-map "K" 'evil-jump-out-args)

;; evil-leader config
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  ;; ace jump
  "SPC" 'evil-ace-jump-word-mode
  "l" 'evil-ace-jump-line-mode
  ;; comment
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "c\\" 'evilnc-comment-operator)
(provide 'init-evil)

;; evil module
(evil-mode 1)
(global-evil-leader-mode)
(global-evil-surround-mode 1)
(global-evil-matchit-mode 1)
(evil-exchange-install)
;; (evil-escape-mode)
(require 'evil-iedit-state)
(require 'evil-remember-state)

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

(defun evil-set-default-cursors ()
  (setq evil-emacs-state-cursor `(,(spacemacs/state-color 'emacs) box))
  (setq evil-normal-state-cursor `(,(spacemacs/state-color 'normal) box))
  (setq evil-insert-state-cursor `(,(spacemacs/state-color 'insert) (bar . 2)))
  (setq evil-visual-state-cursor `(,(spacemacs/state-color 'visual) (hbar . 2)))
  (setq evil-motion-state-cursor `(,(spacemacs/state-color 'motion) box))
  (setq evil-lisp-state-cursor `(,(spacemacs/state-color 'lisp) box)))

(spacemacs/set-state-faces)
;;(evil-set-default-cursors)

(evil-mode 1)

(evil-remember-load-state-file)

(define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)
(define-key evil-normal-state-map (kbd "C-p") 'helm-show-kill-ring)
(define-key evil-normal-state-map (kbd "M-q") 'evil-execute-macro)


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
(define-key evil-normal-state-map (kbd "SPC") 'evil-ace-jump-word-mode)

;; evil-leader config
(evil-leader/set-leader ",")
(evil-leader/set-key
  ;; comment
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "c\\" 'evilnc-comment-operator
  "i" 'helm-semantic-or-imenu)
(provide 'init-evil)

(evil-mode 1)
(global-evil-leader-mode)
(global-evil-surround-mode 1)
(global-evil-matchit-mode 1)

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key "SPC" 'evil-ace-jump-word-mode)
(evil-leader/set-key "l" 'evil-ace-jump-line-mode)
(evil-leader/set-key "0" 'delete-window)
(evil-leader/set-key "1" 'delete-other-windows)
(evil-leader/set-key "2" 'split-window-below)
(evil-leader/set-key "3" 'split-window-horizontally)


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

(evil-mode 1)

(provide 'init-evil)

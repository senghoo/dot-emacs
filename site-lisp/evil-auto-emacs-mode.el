(defun mode-map-from-mode-name (mode)
  (ignore-errors
    (symbol-value (intern (concat (symbol-name mode) "-map")))))

(defun basic-char-used-p (mode)
  (let ((map (mode-map-from-mode-name mode)))
    (if map
        (dolist (c (nconc (number-sequence ?a ?z) (number-sequence ?A ?Z)) )
          (let ((cmd (lookup-key map (kbd (string c)) t)))
            (if cmd
                (return (cons c cmd))))))))

(defun list-major-modes ()
  "Returns list of potential major mode names (without the final -mode).
Note, that this is guess work."
  (interactive)
  (let (l)
    (mapatoms #'(lambda (f) (and
                 (commandp f)
                 (string-match "-mode$" (symbol-name f))
                 ;; auto-loaded
                 (or (and (autoloadp (symbol-function f))
                      (let ((doc (documentation f)))
                    (when doc
                      (and
                       (let ((docSplit (help-split-fundoc doc f)))
                         (and docSplit ;; car is argument list
                          (null (cdr (read (car docSplit)))))) ;; major mode starters have no arguments
                       (if (string-match "[mM]inor" doc) ;; If the doc contains "minor"...
                           (string-match "[mM]ajor" doc) ;; it should also contain "major".
                         t) ;; else we cannot decide therefrom
                       ))))
                 (null (help-function-arglist f)))
                 (setq l (cons f l)))))
    (when (called-interactively-p 'any)
      (with-current-buffer (get-buffer-create "*Major Modes*")
    (clear-buffer-delete)
    (let ((standard-output (current-buffer)))
      (display-completion-list l)
      (display-buffer (current-buffer)))))
    l))
(defun evil-auto-emacs-mode-list ()
  (remove-if-not #'basic-char-used-p (list-major-modes)))

(defun evil-auto-emacs-mode ()
  (nconc evil-emacs-state-modes (evil-auto-emacs-mode-list)))

(provide 'evil-auto-emacs-mode)

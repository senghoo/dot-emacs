(defcustom evil-remember-emacs-state-file
  (expand-file-name "evil-remember-emacs-mode.eld"
                    user-emacs-directory)
  "Emacs state record file"
  :group 'evil-remember
  :type 'string)

;; Serialization and unserialization functions are from projectile project.
;; Thanks projectile project.
(defun evil-remember-unserialize (filename)
  (with-demoted-errors
      "Error during file deserialization: %S"
      (when (file-exists-p filename)
        (with-temp-buffer
          (insert-file-contents filename)
          (read (buffer-string))))))

(defun evil-remember-serialize (data filename)
  (when (file-writable-p filename)
    (with-temp-file filename
      (insert (let (print-length) (prin1-to-string data))))))

(defun evil-remember-load-state-file ()
  "load state from file."
  (when (file-exists-p evil-remember-emacs-state-file)
    (setq evil-emacs-state-modes
          (evil-remember-unserialize evil-remember-emacs-state-file))))

(defun evil-remember-save-state-file ()
  "save state to file"
  (evil-remember-serialize evil-emacs-state-modes
                           evil-remember-emacs-state-file))


(advice-add 'evil-emacs-state
            :after
            (lambda (&rest r)
              (add-to-list 'evil-emacs-state-modes
                           major-mode)
              (setq evil-emacs-state-modes (remove-duplicates evil-emacs-state-modes :test 'eq))
              (evil-remember-save-state-file)))

(advice-add 'evil-exit-emacs-state
            :after
            (lambda (&rest r)
              (setq evil-emacs-state-modes (remove-duplicates (delete major-mode evil-emacs-state-modes) :test 'eq))
              (evil-remember-save-state-file)))


(provide 'evil-remember-state)

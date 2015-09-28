(defcustom docker-machine-binary "docker-machine"
  "Docker machine binary file"
  :group 'docker-machine)

(defun docker-machine (action &rest args)
  "Execute docker ACTION passing arguments ARGS."
  (let ((command (format "%s %s %s" docker-machine-binary action (s-join " " (-non-nil args)))))
    (message command)
    (shell-command-to-string command)))

(defun docker-machine-ls-parse (line)
  (mapcar* 'cons '(name driver state url swarm) (s-split "[\s\*]+" line)))

(defun docker-machine--ls ()
  (let* ((data (docker-machine "ls"))
         (lines (s-split "\n" data t))
         (lines (cdr lines)))
    (mapcar 'docker-machine-ls-parse lines)))

(defun docker-machine-envnames ()
  (mapcar 'cdar (docker-machine--ls)))


(defun docker-machine-env (name)
  (interactive
   (list
    (completing-read "Env:" (docker-machine-envnames))))
  (docker-machine--env name))

(defun docker-machine--env (name)
  (let* ((data (docker-machine "env" name))
         (lines (s-split "\n" data t)))
    (dolist (line lines)
      (when (string-match "export \\(.+\\)=\"\\(.+\\)\"" line)
          (setenv (match-string 1 line) (match-string 2 line))))
    (when (not (string= (getenv "DOCKER_MACHINE_NAME") name))
      (message data))))

(defun docker-machine-start (name)
  (interactive
   (list
    (completing-read "Env:" (docker-machine-envnames))))
  (with-output-to-temp-buffer "*docker-machine-start*"
    (async-shell-command (format "%s start %s" docker-machine-binary name)
                   "*docker-machine-start*"
                   "*Messages*")
    (pop-to-buffer "*docker-machine-start*")))


(provide 'docker-machine)

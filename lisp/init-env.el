(require 'exec-path-from-shell)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE" "GOPATH" "PYENV_ROOT"))
  (add-to-list 'exec-path-from-shell-variables var))
(exec-path-from-shell-initialize)


(set-default 'default-directory "~/")
;; (exec-path-from-shell-copy-env "LC_CTYPE")
;; (setenv "LC_CTYPE" "en_US.UTF-8")
(provide 'init-env)

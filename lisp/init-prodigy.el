(setq-default prodigy-stop-tryouts 20)
(prodigy-define-service
  :name "IPython Notebook"
  :cwd "~/Documents/Math"
  :command "ipython"
  :args '("notebook" "--pprint" "--matplotlib" "--no-browser")
  :ready-message "The IPython Notebook is running at: http://localhost:[0-9]+/"
  :tags '(python)
  :port 8888
  :stop-signal 'kill
  :kill-signal 'sigkill)

(prodigy-define-service
  :name "Docker"
  :tags '(vagrant)
  :command (expand-file-name "extra/scripts/prodigy_vagrant.sh" user-emacs-directory)
  :cwd "~/.local/docker"
  :ready-message "Docker started"
  :stop-signal 'sigint)

(prodigy-define-service
  :name "Clojure REPL"
  :tags '(Clojure)
  :command "lein"
  :args '("repl" ":headless" ":port" "55123")
  :ready-message "nREPL server started on port 55123 on host 127.0.0.1 - nrepl://127.0.0.1:55123"
  :stop-signal 'sigint)

(global-set-key (kbd "C-\\") 'prodigy)
(provide 'init-prodigy)

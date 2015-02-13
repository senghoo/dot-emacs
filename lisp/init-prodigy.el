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

(global-set-key (kbd "C-\\") 'prodigy)
(provide 'init-prodigy)

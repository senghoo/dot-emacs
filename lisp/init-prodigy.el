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
(global-set-key (kbd "C-\\") 'prodigy)
(provide 'init-prodigy)

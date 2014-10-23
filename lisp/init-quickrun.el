(quickrun-add-command "sae-deploy"
                      '((:command . "saecloud")
                        (:exec . "%c deploy")
                        (:description "Deploy sae app"))
                      :mode 'python-mode)
(global-set-key (kbd "C-z") 'helm-quickrun)
(provide 'init-quickrun)

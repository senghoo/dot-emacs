(load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
(add-hook 'before-save-hook 'gofmt-before-save)
(defun my-go-mode ()
  (require 'flymake-go)
  (setq gofmt-command "goimports")
  (set (make-local-variable 'company-backends) '(company-go))
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go generate && go build -v && go test -v && go vet"))
  (evil-leader/set-key-for-mode 'go-mode
    ",." 'godef-jump
    ",," 'pop-tag-mark
    ",?" 'godoc-at-point))
(add-hook 'go-mode-hook 'my-go-mode)
(provide 'init-lang-go)

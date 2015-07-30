(require 'cider)
(setq cider-known-endpoints '(("local repl" "127.0.0.1" "55123") ))

(defun nrepl-connect (host port)
  "Connect to machine identified by HOST and PORT.
For local hosts use a direct connection.  For remote hosts, if
`nrepl-force-ssh-for-remote-hosts' is nil, attempt a direct connection
first.  If `nrepl-force-ssh-for-remote-hosts' is non-nil or the direct
connection failed, try to start a SSH tunneled connection.  Return a plist
of the form (:proc PROC :host \"HOST\" :port PORT) that might contain
additional key-values depending on the connection type."
  (let ((localp (if host
                    (nrepl-local-host-p host)
                  (not (file-remote-p default-directory)))))
    (if  localp
        (nrepl--direct-connect (or host "127.0.0.1") port)
      (or (and host (not nrepl-force-ssh-for-remote-hosts)
               (nrepl--direct-connect host port 'no-error))
          (nrepl--ssh-tunnel-connect host port)))))

(provide 'init-lang-clojure)

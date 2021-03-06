;; Use C-f during file selection to switch to regular find-file
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)
(setq ido-use-virtual-buffers t)

(ido-ubiquitous-mode t)

;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)

;; Use smex to handle M-x
(global-set-key [remap execute-extended-command] 'smex)


(provide 'init-ido)

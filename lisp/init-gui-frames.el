;;----------------------------------------------------------------------------
;; Suppress GUI features
;;----------------------------------------------------------------------------
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(tool-bar-mode -1)
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
(setq indicate-empty-lines t)
(global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)
(provide 'init-gui-frames)

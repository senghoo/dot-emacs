(defmacro defun-add-hook (hookname &rest sexplist)
  `(add-hook ,hookname (function (lambda () ,@sexplist))))

(provide 'init-base)

(use-package gdb-mi
  :config
  (setq gdb-many-windows t))

(use-package browse-url
  :config
  ;; TODO: setup auto detect
  (setq browse-url-browser-function 'browse-url-chromium))

(use-package s
  :ensure t)

(use-package fringe-helper
  :ensure t)

(provide 'my-util)

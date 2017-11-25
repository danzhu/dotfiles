(use-package gdb-mi
  :custom
  (gdb-many-windows t))

(use-package browse-url
  :custom
  ;; TODO: setup auto detect
  (browse-url-browser-function 'browse-url-chromium))

(use-package s
  :ensure t)

(use-package fringe-helper
  :ensure t)

(provide 'my-util)

(use-package use-package-core
  :custom
  (use-package-always-demand t))

(use-package cus-edit
  :custom
  (custom-buffer-done-kill t)
  (custom-file (expand-file-name "custom.el" user-emacs-directory)))

(use-package diminish
  :ensure t)

(use-package s
  :ensure t)

(provide 'my-library)

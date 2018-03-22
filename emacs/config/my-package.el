;; package
(require 'package)
(customize-set-variable
 'package-archives
 '(("melpa" . "http://melpa.org/packages/")
   ("org" . "http://orgmode.org/elpa/")
   ("gnu" . "http://elpa.gnu.org/packages/")))
(customize-set-variable 'package-enable-at-startup nil)
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(require 'bind-key)

(use-package use-package-core
  :custom
  (use-package-always-demand t))

;; custom
(use-package cus-edit
  :custom
  (custom-buffer-done-kill t)
  (custom-file (expand-file-name "custom.el" user-emacs-directory)))

(provide 'my-package)

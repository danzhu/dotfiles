;; ------------ core settings ------------

(customize-set-variable 'custom-file "~/.emacs.d/custom.el")

(eval-and-compile
  (add-to-list 'load-path (expand-file-name "~/.emacs.d/config")))

(require 'my-settings)

;; ------------ bootstrap packages ------------

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(customize-set-variable 'package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'bind-key)

(customize-set-variable 'use-package-always-demand t)

;; ------------ load configs ------------

(require 'my-library)
(require 'my-evil)
(require 'my-ui)
(require 'my-modeline)
(require 'my-project)
(require 'my-file)
(require 'my-edit)
(require 'my-lang)
(require 'my-hooks)

;; ------------ local config ------------

(load "~/.emacs.d/local.el" :noerror t)

;; ------------ enable features ------------

(dolist (feature '(dired-find-alternate-file
                   narrow-to-region))
  (put feature 'disabled nil))

;; ------------ end ------------

;; ------------ bootstrap ------------

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

(use-package diminish
  :ensure t)

;; ------------ load configs ------------

(eval-and-compile
  (add-to-list 'load-path (expand-file-name "~/.emacs.d/config")))

(require 'my-settings)
(require 'my-util)
(require 'my-ui)
(require 'my-project)
(require 'my-file)
(require 'my-edit)
(require 'my-lang)
(require 'my-evil)
(require 'my-modeline)
(require 'my-hooks)

;; ------------ custom file ------------

(customize-set-variable 'custom-file "~/.emacs.d/custom.el")
(load custom-file :noerror t)

;; ------------ local config ------------

(load "~/.emacs.d/local.el" :noerror t)

;; ------------ enable features ------------

(dolist (feature '(dired-find-alternate-file
                   narrow-to-region))
  (put feature 'disabled nil))

;; ------------ end ------------

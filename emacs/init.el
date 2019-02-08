;; load path
(eval-and-compile
  (add-to-list 'load-path (expand-file-name "config" user-emacs-directory)))

;; core settings
(require 'my-settings)

;; package
(require 'package)
(customize-set-variable
 'package-archives
 '(("melpa" . "https://melpa.org/packages/")
   ("org" . "https://orgmode.org/elpa/")
   ("gnu" . "https://elpa.gnu.org/packages/")))
(customize-set-variable 'package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(require 'bind-key)

;; categories
(require 'my-library)
(require 'my-ui)
(require 'my-modeline)
(require 'my-project)
(require 'my-file)
(require 'my-edit)
(require 'my-lang)
(require 'my-evil)
(require 'my-hooks)

;; local config
(load (expand-file-name "local.el" user-emacs-directory) :noerror t)

;; finalization
(require 'my-finalize)

;; end

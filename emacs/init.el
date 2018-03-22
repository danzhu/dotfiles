;; load path
(eval-and-compile
  (add-to-list 'load-path (expand-file-name "config" user-emacs-directory)))

;; core settings
(require 'my-settings)
(require 'my-package)
(require 'my-library)

;; categories
(require 'my-ui)
(require 'my-modeline)
(require 'my-project)
(require 'my-file)
(require 'my-edit)
(require 'my-lang)
(require 'my-evil)
(require 'my-hooks)

;; local overrides
(load (expand-file-name "local.el" user-emacs-directory) :noerror t)

;; finalization settings
(require 'my-finalize)

;; end

;; load path
(eval-and-compile
  (add-to-list 'load-path (expand-file-name "~/.emacs.d/config")))

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
(load "~/.emacs.d/local.el" :noerror t)

;; finalization settings
(require 'my-finalize)

;; end

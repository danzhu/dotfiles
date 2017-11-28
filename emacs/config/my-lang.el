(require 'my-package "~/.emacs.d/config/my-package.el")

(use-package irony
  :ensure t
  :defer t
  :hook
  (c++-mode-hook 'irony-mode)
  (c-mode-hook 'irony-mode)
  (objc-mode-hook 'irony-mode)
  (irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package company-irony
  :ensure t
  :after (company irony)
  :hook
  (company-backends 'company-irony))

(use-package company-irony-c-headers
  :ensure t
  :after (company irony)
  :hook
  (company-backends 'company-irony-c-headers))

(use-package flycheck-irony
  :ensure t
  :after (flycheck irony)
  :hook
  (flycheck-mode-hook 'flycheck-irony-setup))

(use-package irony-eldoc
  :ensure t
  :after (irony eldoc)
  :hook
  (irony-mode-hook 'irony-eldoc))

(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'")

(use-package cargo
  :ensure t
  :after rust
  :hook
  (rust-mode-hook 'cargo-minor-mode))

(use-package racer
  :ensure t
  :after rust
  :hook
  (rust-mode-hook 'racer-mode)
  (racer-mode-hook 'eldoc-mode))

(use-package flycheck-rust
  :ensure t
  :after (flycheck rust-mode)
  :hook
  (flycheck-mode-hook 'flycheck-rust-setup))

(use-package elisp-slime-nav
  :ensure t
  :defer t
  :hook
  (emacs-lisp-mode-hook 'elisp-slime-nav-mode)
  (emacs-lisp-mode-hook 'eldoc-mode))

(use-package web-mode
  :ensure t
  :mode ("\\.html\\'" "\\.xml\\'" "\\.svg\\'"))

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :interpreter "node")

(use-package tern
  :ensure t
  :hook
  (js-mode-hook 'tern-mode))

(use-package company-tern
  :ensure t
  :hook
  (company-backends 'company-tern))

(use-package rjsx-mode
  :ensure t
  :mode "\\.jsx\\'")

(use-package elpy
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :interpreter (("python" . python-mode)
                ("python3" . python-mode))
  :hook
  (python-mode-hook 'elpy-mode)
  :config
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (setq elpy-modules (delq 'elpy-module-highlight-indentation elpy-modules)))

(use-package flycheck-mypy
  :ensure t
  ;; :config
  ;; (flycheck-add-next-checker 'python-flake8 'python-mypy)
  )

(use-package latex
  :ensure auctex
  :mode ("\\.tex\\'" . TeX-latex-mode)
  :defines TeX-auto-save TeX-parse-self TeX-save-query TeX-view-program-selection
  :functions TeX-global-PDF-mode
  :custom
  (TeX-auto-save t)
  (TeX-parse-self t)
  (TeX-save-query nil)
  :config
  (when (executable-find "zathura")
    (setq TeX-view-program-selection
          '((output-pdf "Zathura"))))
  (TeX-global-PDF-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode))

(use-package company-auctex
  :ensure t
  :after (company latex)
  :config
  (company-auctex-init))

(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package ess
  :ensure t
  :custom
  (ess-eval-visibly nil))

(use-package gitattributes-mode
  :ensure t)

(use-package gitconfig-mode
  :ensure t)

(use-package gitignore-mode
  :ensure t)

(use-package cmake-mode
  :ensure t
  :mode ("CMakeLists.txt" "\\.cmake\\'"))

(use-package llvm-mode
  :ensure t
  :mode "\\.ll\\'")

(provide 'my-lang)

;; end

(use-package irony
  :ensure t
  :defer t
  :hook (((c++-mode c-mode objc-mode) . irony-mode)
         (irony-mode . irony-cdb-autosetup-compile-options)))

(use-package company-irony
  :ensure t
  :after (company irony)
  :config
  (add-to-list 'company-backends 'company-irony))

(use-package company-irony-c-headers
  :ensure t
  :after (company irony)
  :config
  (add-to-list 'company-backends 'company-irony-c-headers))

(use-package flycheck-irony
  :ensure t
  :defer t
  :after (flycheck irony)
  :hook (flycheck-mode . flycheck-irony-setup))

(use-package irony-eldoc
  :ensure t
  :defer t
  :after (irony eldoc)
  :hook irony-mode)

(use-package rust-mode
  :ensure t
  :defer t
  :mode "\\.rs\\'")

(use-package cargo
  :ensure t
  :defer t
  :after rust-mode
  :hook (rust-mode . cargo-minor-mode))

(use-package racer
  :ensure t
  :defer t
  :after rust-mode
  :hook ((rust-mode . racer-mode)
         (racer-mode . eldoc-mode)))

(use-package flycheck-rust
  :ensure t
  :defer t
  :after (flycheck rust-mode)
  :hook (flycheck-mode . flycheck-rust-setup))

(use-package elisp-slime-nav
  :ensure t
  :defer t
  :hook ((emacs-lisp-mode . elisp-slime-nav-mode)
         (emacs-lisp-mode . eldoc-mode)))

(use-package web-mode
  :ensure t
  :defer t
  :mode ("\\.html\\'" "\\.xml\\'" "\\.svg\\'"))

(use-package js2-mode
  :ensure t
  :defer t
  :mode "\\.js\\'"
  :interpreter "node")

(use-package tern
  :ensure t
  :defer t
  :after js2-mode
  :hook (js-mode . tern-mode))

(use-package company-tern
  :ensure t
  :after js2-mode
  :config
  (add-to-list 'company-backends 'company-tern))

(use-package rjsx-mode
  :ensure t
  :defer t
  :mode "\\.jsx\\'")

(use-package elpy
  :ensure t
  :defer t
  :mode ("\\.py\\'" . python-mode)
  :interpreter (("python" . python-mode)
                ("python3" . python-mode))
  :hook (python-mode . elpy-mode)
  :config
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (setq elpy-modules (delq 'elpy-module-highlight-indentation elpy-modules)))

;; (use-package flycheck-mypy
;;   :ensure t
;;   :after (flycheck elpy)
;;   :config
;;   (flycheck-add-next-checker 'python-flake8 'python-mypy))

(use-package latex
  :ensure auctex
  :defer t
  :mode ("\\.tex\\'" . TeX-latex-mode)
  :hook (LaTeX-mode . LaTeX-math-mode)
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
  (TeX-global-PDF-mode 1))

(use-package company-auctex
  :ensure t
  :after (company latex)
  :config
  (company-auctex-init))

(use-package markdown-mode
  :ensure t
  :defer t
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
  :defer t
  :mode ("CMakeLists.txt" "\\.cmake\\'"))

(use-package llvm-mode
  :ensure t
  :defer t
  :mode "\\.ll\\'")

(provide 'my-lang)

;; end

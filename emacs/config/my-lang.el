(use-package irony
  :ensure t
  :mode (("\\.cc\\'" . c++-mode)
         ("\\.cpp\\'" . c++-mode)
         ("\\.m\\'" . objc-mode)
         ("\\.c\\'" . c-mode))
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

  (use-package company-irony
    :ensure t
    :config
    (add-to-list 'company-backends 'company-irony))

  (use-package company-irony-c-headers
    :ensure t
    :config
    (add-to-list 'company-backends '(company-irony-c-headers company-irony)))

  (use-package flycheck-irony
    :ensure t
    :config
    (add-hook 'flycheck-mode-hook 'flycheck-irony-setup))

  (use-package irony-eldoc
    :ensure t
    :config
    (add-hook 'irony-mode-hook 'irony-eldoc)))

(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :config
  (use-package cargo
    :ensure t
    :config
    (add-hook 'rust-mode-hook 'cargo-minor-mode))

  (use-package racer
    :ensure t
    :config
    (add-hook 'rust-mode-hook 'racer-mode)
    (add-hook 'racer-mode-hook 'company-mode)
    (add-hook 'racer-mode-hook 'eldoc-mode))

  (use-package flycheck-rust
    :ensure t
    :config
    (add-hook 'flycheck-mode-hook 'flycheck-rust-setup)))

(use-package elisp-slime-nav
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)
  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode))

(use-package web-mode
  :ensure t
  :mode ("\\.html\\'" "\\.xml\\'" "\\.svg\\'"))

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :interpreter "node"
  :config
  (use-package tern
    :ensure t
    :config
    (add-hook 'js-mode-hook 'tern-mode))

  (use-package company-tern
    :ensure t
    :config
    (add-to-list 'company-backends 'company-tern)))

(use-package rjsx-mode
  :ensure t
  :mode "\\.jsx\\'")

(use-package elpy
  :ensure t
  ;; :mode ("\\.py\\'" . python-mode)
  ;; :interpreter (("python" . python-mode)
  ;;               ("python3" . python-mode))
  :config
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (setq elpy-modules (delq 'elpy-module-highlight-indentation elpy-modules))
  (elpy-enable)

  (use-package flycheck-mypy
    :ensure t
    ;; :config
    ;; (flycheck-add-next-checker 'python-flake8 'python-mypy)
    ))

(use-package tex-mode
  :ensure auctex
  :mode ("\\.tex\\'" . TeX-latex-mode)
  :defines TeX-auto-save TeX-parse-self TeX-save-query TeX-PDF-mode TeX-view-program-selection
  :custom
  (TeX-auto-save t)
  (TeX-parse-self t)
  (TeX-save-query nil)
  :config
  (when (executable-find "zathura")
    (setq TeX-view-program-selection
          '((output-pdf "Zathura"))))
  (TeX-global-PDF-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

  (use-package company-auctex
    :ensure t
    :config
    (company-auctex-init)))

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

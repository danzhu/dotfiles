(use-package cc-mode
  :mode ("\\.h\\'" . c++-mode)
  :custom
  (c-basic-offset 4)
  (c-default-style "bsd")
  (c-tab-always-indent nil))

(use-package asm-mode
  :defer t
  :mode "\\.s\\'"
  :custom
  (asm-comment-char ?#))

(use-package sh-script
  :defer t
  :mode ("/PKGBUILD\\'" . sh-mode))

(use-package python
  :defer t
  :mode ("\\.py\\'" . python-mode)
  :interpreter (("python" . python-mode)
                ("python2" . python-mode)
                ("python3" . python-mode))
  :init
  (defun my-python-mode-hook ()
    (setq-local flycheck-checker 'python-mypy)
    ;; (lsp)
    )
  (add-hook 'python-mode-hook 'my-python-mode-hook)
  :custom
  (python-indent-guess-indent-offset-verbose nil))

(use-package conf-mode
  :defer t
  :mode "\\.hook\\'")

(use-package org
  :defer t
  :mode ("\\.org\\'" . org-mode)
  :custom
  (org-log-done 'time)
  :bind
  (:map org-mode-map
        ("M-h" . nil)))

(use-package octave
  :defer t
  :mode ("\\.m\\'" . octave-mode))

(use-package irony
  :ensure t
  :defer t
  :hook (((c++-mode c-mode objc-mode) . irony-mode)
         (irony-mode . irony-cdb-autosetup-compile-options))
  :custom
  (irony-cdb-compilation-databases '(irony-cdb-libclang
                                     irony-cdb-json
                                     irony-cdb-clang-complete)))

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

(use-package rtags
  :ensure t
  :defer t
  :hook ((c++-mode c-mode objc-mode) . rtags-start-process-unless-running)
  :custom
  (rtags-display-result-backend 'ivy)
  :config
  (rtags-enable-standard-keybindings)
  :bind
  (:map c-mode-base-map
        ("M-." . rtags-find-symbol-at-point)
        ("M-," . rtags-find-references-at-point)))

(use-package ivy-rtags
  :ensure t
  :after rtags)

(use-package rust-mode
  :ensure t
  :defer t
  :custom
  (rust-format-on-save t)
  (rust-match-angle-brackets nil))

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

(use-package lsp-java
  :ensure t
  :after lsp
  :hook (java-mode . lsp)
  :custom
  (lsp-java--workspace-folders '("~/test")))

(use-package elisp-slime-nav
  :ensure t
  :defer t
  :hook ((emacs-lisp-mode . elisp-slime-nav-mode)
         (emacs-lisp-mode . eldoc-mode)))

(use-package web-mode
  :ensure t
  :defer t
  :mode ("\\.html\\'" "\\.xml\\'" "\\.svg\\'")
  :custom
  (web-mode-markup-indent-offset 2))

(use-package pug-mode
  :ensure t
  :defer t
  :mode "\\.pug\\'"
  :custom
  (pug-tab-width 2))

(use-package js2-mode
  :ensure t
  :defer t
  :mode "\\.js\\'"
  :interpreter "node"
  :custom
  (js2-include-node-externs t)
  (js2-strict-missing-semi-warning nil))

(use-package typescript-mode
  :ensure t
  :defer t
  :mode "\\.ts\\'"
  :interpreter "ts-node"
  :hook (typescript-mode . lsp))

;; (use-package tern
;;   :ensure t
;;   :defer t
;;   :after js2-mode
;;   :hook (js-mode . tern-mode))

;; (use-package company-tern
;;   :ensure t
;;   :after (company js2-mode)
;;   :config
;;   (add-to-list 'company-backends 'company-tern))

(use-package rjsx-mode
  :ensure t
  :defer t
  :mode "\\.jsx\\'")

(use-package anaconda-mode
  :ensure t
  :defer t
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode)))

(use-package company-anaconda
  :ensure t
  :after (company anaconda-mode)
  :config
  (add-to-list 'company-backends 'company-anaconda))

;; (use-package elpy
;;   :ensure t
;;   :defer t
;;   :mode ("\\.py\\'" . python-mode)
;;   :interpreter (("python" . python-mode)
;;                 ("python3" . python-mode))
;;   :hook (python-mode . elpy-mode)
;;   :config
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (setq elpy-modules (delq 'elpy-module-highlight-indentation elpy-modules)))

;; (use-package flycheck-mypy
;;   :ensure t
;;   :after (flycheck elpy)
;;   :config
;;   (flycheck-add-next-checker 'python-flake8 'python-mypy))

(use-package lua-mode
  :ensure t
  :defer t
  :mode "\\.lua\\'"
  :interpreter "lua"
  :custom
  (lua-indent-level 4))

(use-package haskell-mode
  :ensure t
  :defer t
  :mode "\\.hs\\'")

(use-package lsp-haskell
  :ensure t
  :after lsp
  :hook (haskell-mode . lsp))

(use-package idris-mode
  :ensure t
  :defer t
  :mode "\\.idr\\'")

(use-package sml-mode
  :ensure t
  :defer t
  :mode "\\.sml\\'")

(use-package racket-mode
  :ensure t
  :defer t
  :mode "\\.rkt\\'")

(use-package glsl-mode
  :ensure t
  :defer t
  :mode (("\\.glsl\\'" . glsl-mode)
         ("\\.vert\\'" . glsl-mode)
         ("\\.frag\\'" . glsl-mode)
         ("\\.vs\\'" . glsl-mode)
         ("\\.fs\\'" . glsl-mode)))

(use-package evil-org
  :ensure t
  :defer t
  :after org
  :hook ((org-mode . evil-org-mode)
         (evil-org-mode . evil-org-set-key-theme)))

(use-package latex
  :ensure auctex
  :defer t
  :mode ("\\.tex\\'" . TeX-latex-mode)
  :hook (LaTeX-mode . LaTeX-math-mode)
  :functions TeX-global-PDF-mode
  :custom
  (TeX-auto-save t)
  (TeX-parse-self t)
  (TeX-save-query nil)
  (TeX-source-correlate-mode t)
  :config
  (when (executable-find "zathura")
    (customize-set-variable 'TeX-view-program-selection '((output-pdf "Zathura"))))
  (TeX-global-PDF-mode 1))

(use-package company-auctex
  :ensure t
  :after (company latex)
  :config
  (company-auctex-init))

(use-package markdown-mode
  :ensure t
  :defer t
  :mode ("\\.md\\'" . gfm-mode))

(use-package yaml-mode
  :ensure t
  :defer t
  :mode "\\.yaml\\'")

(use-package csv-mode
  :ensure t
  :defer t
  :mode "\\.csv\\'")

(use-package ess
  :ensure t)

(use-package gitattributes-mode
  :ensure t
  :defer t)

(use-package gitconfig-mode
  :ensure t
  :defer t)

(use-package gitignore-mode
  :ensure t
  :defer t)

(use-package cmake-mode
  :ensure t
  :defer t)

(provide 'my-lang)

;; end

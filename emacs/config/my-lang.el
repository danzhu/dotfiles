(use-package cc-mode
  :mode ("\\.h\\'" . c++-mode)
  :custom
  (c-basic-offset 4)
  (c-default-style "bsd")
  (c-tab-always-indent nil))

(use-package asm-mode
  :defer t
  :custom
  (asm-comment-char ?#))

(use-package sh-script
  :defer t
  :mode ("/PKGBUILD\\'" . sh-mode)
  :hook (sh-mode . lsp))

(use-package python
  :defer t
  :init
  (defun my-python-mode-hook ()
    (setq-local flycheck-checker 'python-mypy)
    (lsp))
  :hook (python-mode . my-python-mode-hook)
  :custom
  (python-indent-guess-indent-offset-verbose nil))

(use-package lisp-mode
  :defer t
  :init
  (defun my-lisp-indent-function (indent-point state)
    "Customized `lisp-indent-function' to properly deal with keyword lists."
    (let ((normal-indent (current-column)))
      (goto-char (1+ (elt state 1)))
      (parse-partial-sexp (point) calculate-lisp-indent-last-sexp 0 t)
      (if (and (elt state 2)
               (or (not (looking-at "\\sw\\|\\s_"))
                   ;; don't indent keyword lists
                   (looking-at ":")))
          ;; car of form doesn't seem to be a symbol
          (progn
            (if (not (> (save-excursion (forward-line 1) (point))
                        calculate-lisp-indent-last-sexp))
                (progn (goto-char calculate-lisp-indent-last-sexp)
                       (beginning-of-line)
                       (parse-partial-sexp (point)
                                           calculate-lisp-indent-last-sexp 0 t)))
            ;; Indent under the list or under the first sexp on the same
            ;; line as calculate-lisp-indent-last-sexp.  Note that first
            ;; thing on that line has to be complete sexp since we are
            ;; inside the innermost containing sexp.
            (backward-prefix-chars)
            (current-column))
        (let ((function (buffer-substring (point)
                                          (progn (forward-sexp 1) (point))))
              method)
          (setq method (or (function-get (intern-soft function)
                                         'lisp-indent-function)
                           (get (intern-soft function) 'lisp-indent-hook)))
          (cond ((or (eq method 'defun)
                     (and (null method)
                          (> (length function) 3)
                          (string-match "\\`def" function)))
                 (lisp-indent-defform state indent-point))
                ((integerp method)
                 (lisp-indent-specform method state
                                       indent-point normal-indent))
                (method
		 (funcall method indent-point state)))))))
  :custom
  (lisp-indent-function #'my-lisp-indent-function))

(use-package conf-mode
  :defer t
  :mode "\\.hook\\'")

(use-package org
  :defer t
  :custom
  (org-log-done 'time))

(use-package octave
  :defer t
  :mode ("\\.m\\'" . octave-mode))

(use-package irony
  :ensure t
  :defer t
  :hook
  (((c++-mode c-mode objc-mode) . irony-mode)
   (irony-mode . irony-cdb-autosetup-compile-options))
  :custom
  (irony-cdb-compilation-databases
   '(irony-cdb-libclang
     irony-cdb-json
     irony-cdb-clang-complete)))

(use-package company-irony
  :ensure t
  :defer t
  :config
  (add-to-list 'company-backends 'company-irony))

(use-package company-irony-c-headers
  :ensure t
  :defer t
  :config
  (add-to-list 'company-backends 'company-irony-c-headers))

(use-package flycheck-irony
  :ensure t
  :defer t
  :hook (flycheck-mode . flycheck-irony-setup))

(use-package irony-eldoc
  :ensure t
  :defer t
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
  :hook (rust-mode . cargo-minor-mode))

(use-package racer
  :ensure t
  :defer t
  :hook
  ((rust-mode . racer-mode)
   (racer-mode . eldoc-mode)))

(use-package flycheck-rust
  :ensure t
  :defer t
  :hook (flycheck-mode . flycheck-rust-setup))

(use-package lsp-java
  :ensure t
  :defer t
  :hook (java-mode . lsp)
  :custom
  (lsp-java--workspace-folders '("~/projects/test")))

(use-package elisp-slime-nav
  :ensure t
  :defer t
  :hook
  ((emacs-lisp-mode . elisp-slime-nav-mode)
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
  :custom
  (pug-tab-width 2))

(use-package js2-mode
  :ensure t
  :defer t
  :mode "\\.js\\'"
  :interpreter "node"
  :hook (js2-mode . lsp)
  :custom
  (js2-include-node-externs t)
  (js2-strict-missing-semi-warning nil))

(use-package typescript-mode
  :ensure t
  :defer t
  :mode "\\.tsx\\'"
  :interpreter "ts-node"
  :hook (typescript-mode . lsp))

(use-package rjsx-mode
  :ensure t
  :defer t)

(use-package lua-mode
  :ensure t
  :defer t
  :custom
  (lua-indent-level 4))

(use-package haskell-mode
  :ensure t
  :defer t)

(use-package lsp-haskell
  :ensure t
  :defer t
  :hook (haskell-mode . lsp)
  :custom
  (lsp-haskell-process-path-hie "haskell-language-server-wrapper")
  :config
  ;; TODO: figure out why it doesn't work (ExitFailure 1)
  ;; (lsp-haskell-set-config "formattingProvider" "brittany")
  )

(use-package idris-mode
  :ensure t
  :defer t)

(use-package sml-mode
  :ensure t
  :defer t)

(use-package racket-mode
  :ensure t
  :defer t)

(use-package elixir-mode
  :ensure t
  :defer t
  :hook (elixir-mode . lsp)
  :custom
  (lsp-clients-elixir-server-executable "/usr/lib/elixir-ls/language_server.sh"))

(use-package purescript-mode
  :ensure t
  :defer t
  :hook
  ((purescript-mode . turn-on-purescript-indentation)
   (purescript-mode . lsp)))

(use-package csharp-mode
  :ensure t
  :defer t)

(use-package json-mode
  :ensure t
  :defer t)

(use-package dhall-mode
  :ensure t
  :defer t)

(use-package glsl-mode
  :ensure t
  :defer t
  :mode ("\\.vs\\'" "\\.fs\\'"))

(use-package evil-org
  :ensure t
  :defer t
  :after org
  :hook
  ((org-mode . evil-org-mode)
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
  :defer t)

(use-package csv-mode
  :ensure t
  :defer t)

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

(use-package dockerfile-mode
  :ensure t
  :defer t)

(use-package protobuf-mode
  :ensure t
  :defer t)

(provide 'my-lang)

;; end

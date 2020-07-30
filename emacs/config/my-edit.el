(use-package simple
  :diminish visual-line-mode
  :hook
  ((org-mode . visual-line-mode)
   (text-mode . auto-fill-mode))
  :config
  (column-number-mode 1)
  (global-visual-line-mode 1)
  (line-number-mode 1))

(use-package elec-pair
  :config
  (electric-pair-mode 1))

(use-package electric
  :config
  (electric-indent-mode 1))

(use-package subword
  :diminish subword-mode
  :config
  (global-subword-mode 1))

(use-package prog-mode
  :config
  (global-prettify-symbols-mode))

(use-package flyspell
  :defer t
  :hook (text-mode . flyspell-mode))

(use-package ispell
  :custom
  (ispell-silently-savep t))

(use-package isearch
  :when (>= emacs-major-version 26)
  :bind
  (
   :map isearch-mode-map
   ("<escape>" . isearch-abort)))

(use-package eldoc
  :diminish eldoc-mode
  :custom
  (eldoc-idle-delay 0.1))

(use-package company
  :ensure t
  :diminish company-mode
  :custom
  (company-idle-delay 0.1)
  (company-minimum-prefix-length 3)
  (company-require-match nil)
  (company-selection-wrap-around t)
  :config
  (global-company-mode 1)
  ;; (company-tng-configure-default)
  :bind
  (
   :map company-mode-map
   ("C-SPC" . company-complete)
   ("C-@" . company-complete)
   :map company-active-map
   ("<tab>" . company-complete-selection)
   ("C-n" . company-select-next)
   ("C-p" . company-select-previous)
   ("M-c" . company-complete-common)
   ("RET" . nil)
   ("<return>" . nil)
   ("C-w" . nil)
   ("C-h" . nil)
   ("M-n" . nil)
   ("M-p" . nil)))

(use-package company-template
  :after company
  :bind
  (
   :map company-template-nav-map
   ("M-n" . company-template-forward-field)
   ("<tab>" . nil)
   ("TAB" . nil)))

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1)
  :bind
  (
   :map yas-minor-mode-map
   ("M-SPC" . yas-expand)
   ("<tab>" . nil)
   ("TAB" . nil)
   :map yas-keymap
   ("M-SPC" . yas-maybe-expand)
   ("M-n" . yas-next-field)
   ("M-p" . yas-prev-field)
   ("<tab>" . nil)
   ("TAB" . nil)
   ("<backtab>" . nil)
   ("S-TAB" . nil)))

(use-package yasnippet-snippets
  :ensure t)

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :custom
  (flycheck-display-errors-delay 0.5)
  :config
  (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
  (global-flycheck-mode 1))

(use-package lsp-mode
  :ensure t
  :defer t
  :commands lsp
  :hook (lsp-mode . lsp-enable-which-key-integration)
  :custom
  (lsp-eldoc-enable-hover nil)
  (lsp-keep-workspace-alive nil)
  (lsp-keymap-prefix "C-l")
  ;; (lsp-log-io t)
  )

(use-package lsp-ui
  :ensure t
  :defer t
  :commands lsp-ui-mode
  :custom
  (lsp-ui-doc-border "dim gray")
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-max-height 20)
  (lsp-ui-doc-max-width 80)
  (lsp-ui-doc-position 'bottom)
  (lsp-ui-doc-use-childframe t))

(use-package company-lsp
  :ensure t
  :defer t
  :commands company-lsp)

(use-package dap-mode
  :ensure t
  :config
  (dap-mode 1)
  (dap-ui-mode 1))

(use-package dumb-jump
  :ensure t
  :defer t
  :custom
  (dumb-jump-selector 'ivy)
  :bind
  ("C-M-g" . dumb-jump-go))

(use-package editorconfig
  :ensure t
  :diminish editorconfig-mode
  :config
  (editorconfig-mode 1))

(use-package ws-butler
  :ensure t
  :diminish ws-butler-mode
  :custom
  (ws-butler-keep-whitespace-before-point nil)
  :config
  (ws-butler-global-mode 1))

(provide 'my-edit)

;; end

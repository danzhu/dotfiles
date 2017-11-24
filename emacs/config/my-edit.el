(use-package autorevert
  :config
  (global-auto-revert-mode 1))

(use-package saveplace
  :config
  (save-place-mode t))

(use-package savehist
  :config
  (savehist-mode 1))

(use-package jka-cmpr-hook
  :config
  (auto-compression-mode 1))

(use-package vc-hooks
  :config
  (setq vc-follow-symlinks t))

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
  :config
  (add-hook 'text-mode-hook
            (lambda () (flyspell-mode 1))))

(use-package eldoc
  :diminish eldoc-mode
  :init
  (setq eldoc-idle-delay 0.1))

(use-package which-func
  :config
  (which-function-mode 1))

(use-package cc-vars
  :config
  (setq c-basic-offset 4)
  (setq c-default-style "bsd"))

(use-package company
  :ensure t
  :demand t
  :diminish company-mode
  :defines company-template-nav-map
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (global-company-mode 1)
  (company-tng-configure-default)
  :bind
  (:map company-mode-map
        ("C-SPC" . company-complete)
        :map company-active-map
        ("C-w" . nil)
        ("M-n" . nil)
        ("M-p" . nil)
        :map company-template-nav-map
        ("<tab>" . nil)
        ("TAB" . nil)
        ("M-n" . company-template-forward-field)))

(use-package yasnippet
  :ensure t
  :demand t
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1)
  :bind
  (:map yas-minor-mode-map
        ("<tab>" . nil)
        ("TAB" . nil)
        ("M-SPC" . yas-expand)
        :map yas-keymap
        ("<tab>" . nil)
        ("TAB" . nil)
        ("<backtab>" . nil)
        ("S-TAB" . nil)
        ("M-SPC" . yas-maybe-expand)
        ("M-n" . yas-next-field)
        ("M-p" . yas-prev-field)))

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
  (setq flycheck-display-errors-delay 0.2)
  ;; (setq flycheck-indication-mode 'right-fringe)
  (global-flycheck-mode 1))

(use-package dumb-jump
  :ensure t
  :config
  (setq dumb-jump-selector 'ivy)
  (dumb-jump-mode))

(use-package editorconfig
  :ensure t
  :diminish editorconfig-mode
  :config
  (editorconfig-mode 1))

(use-package ws-butler
  :ensure t
  :diminish ws-butler-mode
  :config
  (setq ws-butler-keep-whitespace-before-point nil)
  (ws-butler-global-mode 1))

(provide 'my-edit)

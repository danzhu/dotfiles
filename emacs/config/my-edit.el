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
  :custom
  (eldoc-idle-delay 0.1))

(use-package cc-vars
  :custom
  (c-basic-offset 4)
  (c-default-style "bsd"))

(use-package company
  :ensure t
  :demand t
  :diminish company-mode
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  (company-selection-wrap-around t)
  :config
  (global-company-mode 1)
  (company-tng-configure-default)
  :bind
  (:map company-mode-map
        ("C-SPC" . company-complete)
        :map company-active-map
        ("C-w" . nil)
        ("M-n" . nil)
        ("M-p" . nil)))

(use-package company-template
  :defer 4
  :after company
  :bind
  (:map company-template-nav-map
        ("<tab>" . nil)
        ("TAB" . nil)
        ("M-n" . company-template-forward-field)))

(use-package yasnippet
  :ensure t
  :defer 4
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
  :custom
  (flycheck-display-errors-delay 0.2)
  :config
  (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
  (global-flycheck-mode 1))

(use-package dumb-jump
  :ensure t
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
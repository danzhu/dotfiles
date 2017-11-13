;; ------------ options ------------

;; startup
(setq inhibit-startup-screen t)
(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message nil)

;; display
(setq echo-keystrokes 0.1)
(setq frame-title-format '("%b"))
(setq ring-bell-function 'ignore)
(setq scroll-conservatively 100)
(setq scroll-margin 5)
(setq scroll-preserve-screen-position 'always)
(setq scroll-step 1)
(setq use-dialog-box nil)
(setq-default fringes-outside-margins t)

;; editing
(auto-compression-mode t)
(setq-default fill-column 80)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; files
(setq make-backup-files nil)
(setq save-abbrevs nil)
(setq-default require-final-newline t)
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save-list/" t)))

;; editor
(setq gc-cons-threshold 50000000)
(setq vc-follow-symlinks t)
(fset 'yes-or-no-p 'y-or-n-p)

;; ------------ hooks ------------

(defun my-prog-mode-hook ()
  (font-lock-add-keywords
   nil
   '(("\\<\\(TODO\\|FIXME\\|XXX\\|HACK\\):" 1 highlight t))))
(add-hook 'prog-mode-hook 'my-prog-mode-hook)

(defun my-term-mode-hook ()
  (setq-local global-hl-line-mode nil)
  (setq-local scroll-margin 0))
(add-hook 'term-mode-hook 'my-term-mode-hook)

;; ------------ misc ------------

(put 'dired-find-alternate-file 'disabled nil)

;; ------------ custom file ------------

(setq custom-file "~/.emacs.d/custom.el")
(if (file-readable-p "~/.emacs.d/custom.el")
    (load custom-file))

;; ------------ local config ------------
(if (file-readable-p "~/.emacs.d/local.el")
    (load "~/.emacs.d/local.el"))

;; ------------ bootstrap ------------

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; ------------ builtin packages ------------

(use-package simple
  :diminish visual-line-mode
  :config
  (column-number-mode t)
  (global-visual-line-mode 1)
  (size-indication-mode 1)
  (setq shift-select-mode nil)
  (add-hook 'org-mode-hook 'visual-line-mode))

(use-package menu-bar
  :config
  (menu-bar-mode -1))

(use-package scroll-bar
  :config
  (scroll-bar-mode -1))

(use-package tool-bar
  :config
  (tool-bar-mode -1))

(use-package prog-mode
  :config
  (global-prettify-symbols-mode))

(use-package flyspell
  :config
  (add-hook 'text-mode-hook
            (lambda () (flyspell-mode 1))))

(use-package saveplace
  :config
  (save-place-mode t))

(use-package savehist
  :config
  (savehist-mode 1))

(use-package buff-menu
  :bind
  (:map global-map
        ("C-x C-b" . buffer-menu-other-window)))

(use-package eldoc
  :diminish eldoc-mode
  :init
  (setq eldoc-idle-delay 0.1))

(use-package autorevert
  :config
  (global-auto-revert-mode t))

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

(use-package hl-line
  :config
  (setq global-hl-line-sticky-flag t)
  (global-hl-line-mode t))

(use-package paren
  :config
  (setq show-paren-delay 0)
  (show-paren-mode t))

(use-package xt-mouse
  :config
  (xterm-mouse-mode t))

(use-package mwheel
  :config
  (mouse-wheel-mode t))

(use-package gdb-mi
  :config
  (setq gdb-many-windows t))

(use-package cc-vars
  :config
  (setq c-basic-offset 4)
  (setq c-default-style "bsd"))

;; ------------ third party packages ------------

;; utility
(use-package fringe-helper
  :ensure t)

;; interface
(use-package autothemer
  :ensure t
  :config
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
  (load-theme 'code t))

(use-package nlinum
  :ensure t
  :config
  (setq nlinum-format " %d ")
  (setq nlinum-highlight-current-line t)
  (dolist (hook '(text-mode-hook prog-mode-hook conf-mode-hook))
    (add-hook hook
              (lambda () (nlinum-mode 1)))))

(use-package paradox
  :ensure t
  :functions paradox-enable
  :config
  (setq paradox-execute-asynchronously t)
  (paradox-enable))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist
        '((".*" . "~/.emacs.d/undo-history/")))
  (global-undo-tree-mode))

;; editing
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

(use-package company
  :ensure t
  :diminish company-mode
  :defines company-template-nav-map
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (global-company-mode)
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
  :config
  (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
  (setq flycheck-display-errors-delay 0.2)
  ;; (setq flycheck-indication-mode 'right-fringe)
  (add-hook 'prog-mode-hook
            (lambda () (flycheck-mode 1))))

(use-package dumb-jump
  :ensure t
  :config
  (setq dumb-jump-selector 'ivy)
  (dumb-jump-mode))

(use-package avy
  :ensure t
  :config
  (setq avy-keys (number-sequence ?a ?z))
  (avy-setup-default)
  :bind
  (:map global-map
        ("M-g j" . avy-goto-line-below)
        ("M-g k" . avy-goto-line-above)
        ("M-g l" . avy-goto-line)
        ("M-g w" . avy-goto-word)
        ("M-g c" . avy-goto-char-timer)))

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-format-function 'ivy-format-function-arrow)
  (ivy-mode 1)
  :bind
  (:map global-map
        ("C-c C-r" . ivy-resume)))

(use-package counsel
  :ensure t
  :bind
  (:map global-map
        ("M-x" . counsel-M-x)
        ("C-x C-f" . counsel-find-file)
        ("C-h f" . counsel-describe-function)
        ("C-h v" . counsel-describe-variable)
        ("C-c g" . counsel-git)
        ("C-c k" . counsel-ag)
        ("C-x l" . counsel-locate)))

(use-package swiper
  :ensure t
  :bind
  (:map global-map
        ("C-s" . swiper)))

(use-package ivy-hydra
  :ensure t)

;; project
(use-package magit
  :ensure t
  :config
  (setq magit-completing-read-function 'ivy-completing-read)
  :bind
  (:map global-map
        ("C-x g" . magit-status)))

(use-package git-gutter-fringe
  :ensure t
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode 1)
  (add-hook 'focus-in-hook 'git-gutter:update-all-windows)
  (fringe-helper-define 'git-gutter-fr:added '(center repeated)
    "XX......")
  (fringe-helper-define 'git-gutter-fr:modified '(center repeated)
    "XX......")
  (fringe-helper-define 'git-gutter-fr:deleted 'bottom
    "X......."
    "XX......"
    "XXX....."
    "XXXX...."
    "XXXXX..."
    "XXXXXX.."))

(use-package projectile
  :ensure t
  :config
  (setq projectile-completion-system 'ivy)
  (setq projectile-track-known-projects-automatically nil)
  (setq projectile-mode-line
        '(:eval (format " Proj[%s]" (projectile-project-name))))
  (projectile-mode))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-on))

;; languages
(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

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
  (add-hook 'irony-mode-hook 'irony-eldoc))

(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'")

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
  (add-hook 'flycheck-mode-hook 'flycheck-rust-setup))

(use-package elisp-slime-nav
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)
  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode))

(use-package tex-mode
  :ensure auctex
  :defines TeX-auto-save TeX-parse-self TeX-save-query TeX-PDF-mode
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-save-query nil)
  (setq TeX-PDF-mode t)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode))

(use-package company-auctex
  :ensure t
  :config
  (company-auctex-init))

(use-package web-mode
  :ensure t
  :mode ("\\.html\\'" "\\.xml\\'" "\\.svg\\'"))

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :interpreter "node")

(use-package tern
  :ensure t
  :config
  (add-hook 'js-mode-hook 'tern-mode))

(use-package company-tern
  :ensure t
  :config
  (add-to-list 'company-backends 'company-tern))

(use-package rjsx-mode
  :ensure t
  :mode "\\.jsx\\'")

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package ess
  :ensure t
  :mode "\\.R\\'"
  :interpreter "R"
  :config
  (setq ess-eval-visibly nil))

(use-package gitconfig-mode
  :ensure t)

(use-package cmake-mode
  :ensure t)

(use-package llvm-mode
  :ensure t
  :mode "\\.ll\\'")

(use-package elpy
  :ensure t
  :config
  (elpy-enable)
  (add-hook 'elpy-mode-hook
            (lambda () (highlight-indentation-mode -1))))

(use-package flycheck-mypy
  :ensure t
  ;; :config
  ;; (flycheck-add-next-checker 'python-flake8 'python-mypy)
  )

;; evil
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode t))

(use-package evil
  :ensure t
  :defines evil-want-Y-yank-to-eol
  :functions evil-delay evil-set-initial-state
  :init
  (setq evil-flash-delay 5)
  (setq evil-split-window-below t)
  (setq evil-symbol-word-search t)
  (setq evil-vsplit-window-right t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-Y-yank-to-eol t)
  :config
  (evil-mode t)
  (evil-define-key 'normal emacs-lisp-mode-map
    (kbd "K") 'elisp-slime-nav-describe-elisp-thing-at-point)
  (evil-define-key 'normal dired-mode-map
    (kbd "h") 'dired-up-directory)
  (evil-define-key 'normal dired-mode-map
    (kbd "l") 'dired-find-alternate-file)
  (evil-set-initial-state 'paradox-menu-mode 'motion)
  (evil-set-initial-state 'term-mode 'emacs)
  :bind
  (:map evil-normal-state-map
        ("RET" . save-buffer)
        ("C-p" . nil)
        ("M-." . nil)
        :map evil-motion-state-map
        ("j" . evil-next-visual-line)
        ("k" . evil-previous-visual-line)
        ("$" . evil-end-of-visual-line)
        ("^" . evil-first-non-blank-of-visual-line)
        ("-" . evil-delete-buffer)
        ("H" . evil-prev-buffer)
        ("L" . evil-next-buffer)
        ("SPC" . nil)
        ("C-u" . evil-scroll-up)
        ("C-d" . evil-scroll-down)
        ("C-p" . counsel-projectile)))

;; ------------ end ------------

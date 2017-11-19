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
(setq scroll-preserve-screen-position t)
(setq scroll-step 1)
(setq use-dialog-box nil)
(setq-default fringes-outside-margins t)

;; editing
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
(setq gc-cons-threshold (* 16 1024 1024))
(defalias 'yes-or-no-p 'y-or-n-p)

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

;; ------------ disabled features ------------

(dolist (feature '(dired-find-alternate-file))
  (put feature 'disabled nil))

;; ------------ custom file ------------

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file :noerror t)

;; ------------ local config ------------

(load "~/.emacs.d/local.el" :noerror t)

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

(use-package frame
  :config
  (setq blink-cursor-blinks 0)
  (blink-cursor-mode 1))

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

(use-package winner
  :config
  (winner-mode 1))

(use-package eldoc
  :diminish eldoc-mode
  :init
  (setq eldoc-idle-delay 0.1))

(use-package autorevert
  :config
  (global-auto-revert-mode 1))

(use-package jka-compr-hook
  :config
  (auto-compression-mode 1))

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
  (show-paren-mode 1))

(use-package xt-mouse
  :config
  (xterm-mouse-mode 1))

(use-package mwheel
  :config
  (mouse-wheel-mode 1))

(use-package vc-hooks
  :config
  (setq vc-follow-symlinks t))

(use-package gdb-mi
  :config
  (setq gdb-many-windows t))

(use-package browse-url
  :config
  ;; TODO: setup auto detect
  (setq browse-url-browser-function 'browse-url-chromium))

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
  (setq undo-tree-enable-undo-in-region nil)
  (setq undo-tree-history-directory-alist
        '((".*" . "~/.emacs.d/undo-history/")))
  (global-undo-tree-mode))

(use-package powerline
  :ensure t
  :config
  (setq-default
   mode-line-format
   '("%e"
     (:eval
      (let* ((active (powerline-selected-window-active))
             (mode-line (if active 'mode-line 'mode-line-inactive))
             (mode-line-buffer-id (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
             (face1 (if active 'powerline-active1 'powerline-inactive1))
             (face2 (if active 'powerline-active2 'powerline-inactive2))
             (separator-left (intern (format "powerline-%s-%s"
                                             (powerline-current-separator)
                                             (car powerline-default-separator-dir))))
             (separator-right (intern (format "powerline-%s-%s"
                                              (powerline-current-separator)
                                              (cdr powerline-default-separator-dir))))
             (lhs (list (powerline-raw "%*" mode-line 'l)
                        (powerline-buffer-id mode-line-buffer-id 'l)
                        (powerline-raw " " mode-line)
                        (funcall separator-left mode-line face1)
                        (when (projectile-project-p)
                          (powerline-raw (format "[%s]" (projectile-project-name)) face1 'l))
                        (powerline-vc face1)
                        (powerline-raw " " face1)
                        (funcall separator-left face1 face2)
                        (when (boundp 'flycheck-last-status-change)
                          (pcase flycheck-last-status-change
                            ('no-checker (powerline-raw ":|" face2 'l))
                            ('running (powerline-raw "..." face2 'l))
                            ('errored (powerline-raw ":X" `(error ,face2) 'l))
                            ('finished
                             (let-alist (flycheck-count-errors flycheck-current-errors)
                               (cond
                                (.error (powerline-raw (format ":( %s" .error) `(error ,face2) 'l))
                                (.warning (powerline-raw (format ":/ %s" .warning) `(warning ,face2) 'l))
                                (t (powerline-raw ":)" `(success ,face2) 'l)))))
                            ('interrupted (powerline-raw "interrupt" `(warning ,face2) 'l))
                            ('suspicious (powerline-raw "suspicious" `(warning ,face2) 'l))))))
             (rhs (list (powerline-minor-modes face2 'r)
                        (powerline-raw global-mode-string face2 'r)
                        (funcall separator-right face2 face1)
                        (powerline-major-mode face1 'l)
                        (when evil-mode
                          (powerline-raw evil-mode-line-tag face1))
                        (funcall separator-right face1 mode-line)
                        (powerline-raw " %3l : %2c" mode-line 'r)
                        (powerline-narrow mode-line 'r))))
        (concat (powerline-render lhs)
                (powerline-fill face2 (powerline-width rhs))
                (powerline-render rhs)))))))

;; editing
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
  :diminish flycheck-mode
  :config
  (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
  (setq flycheck-display-errors-delay 0.2)
  ;; (setq flycheck-indication-mode 'right-fringe)
  (global-flycheck-mode 1))

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
  :diminish projectile-mode
  :config
  (setq projectile-completion-system 'ivy)
  (setq projectile-track-known-projects-automatically nil)
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
  :defines TeX-auto-save TeX-parse-self TeX-save-query TeX-PDF-mode TeX-view-program-selection
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-save-query nil)
  (setq TeX-PDF-mode t)
  (when (executable-find "zathura")
    (setq TeX-view-program-selection
          '((output-pdf "Zathura"))))
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
  :mode (("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package ess
  :ensure t
  :config
  (setq ess-eval-visibly nil))

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

(use-package elpy
  :ensure t
  :config
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (setq elpy-modules (delq 'elpy-module-highlight-indentation elpy-modules))
  (elpy-enable))

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

(use-package evil-commentary
  :ensure t
  :diminish evil-commentary-mode
  :config
  (evil-commentary-mode))

(use-package evil
  :ensure t
  :defines evil-want-Y-yank-to-eol
  :functions evil-delay evil-set-initial-state
  :init
  (setq evil-echo-state nil)
  (setq evil-ex-substitute-global t)
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
        ("C-p" . counsel-projectile)
        ("M-." . nil)
        :map evil-motion-state-map
        ("j" . next-line)
        ("k" . previous-line)
        ("$" . evil-end-of-visual-line)
        ("^" . evil-first-non-blank-of-visual-line)
        ("-" . evil-delete-buffer)
        ("H" . evil-prev-buffer)
        ("L" . evil-next-buffer)
        ("SPC" . nil)
        ("C-u" . evil-scroll-up)
        ("C-d" . evil-scroll-down)))

;; ------------ end ------------

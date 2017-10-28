                                        ; display
(column-number-mode t)
(global-hl-line-mode t)
(global-prettify-symbols-mode)
(global-visual-line-mode 1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq scroll-margin 5)
(setq scroll-step 1)
(show-paren-mode t)
(tool-bar-mode -1)
;; (mouse-avoidance-mode 'animate)
;; (setq mouse-avoidance-threshold 10)
;; (setq prettify-symbols-unprettify-at-point t)
;; (global-linum-mode t)
;; (setq-default word-wrap t)
;; (setq inhibit-startup-echo-area-message "h94zhu")

;; (setq scroll-conservatively 0)
;; (setq-default scroll-up-aggressively 0.01
;;               scroll-down-aggressively 0.01)

(defun my-prog-common-hook ()
  (font-lock-add-keywords
   nil
   '(("\\<\\(TODO\\|FIXME\\|XXX\\|HACK\\):" 1 font-lock-warning-face t))))
(add-hook 'prog-common-hook 'my-prog-common-hook)

                                        ; editing
(auto-compression-mode t)
(electric-pair-mode 1)
(electric-indent-mode 1)
(global-auto-revert-mode t)
;; (setq c-basic-offset 4)
(setq c-default-style "bsd")
(setq require-final-newline t)
(setq-default fill-column 80)
;; (setq-default indent-tabs-mode nil)
(setq-default tab-width 8)

                                        ; editor
(savehist-mode 1)
(setq gc-cons-threshold 50000000)
(setq make-backup-files nil)
(setq custom-file "~/.emacs.d/custom.el")
;; (load custom-file)


                                        ; filetypes
;; (defun my-c-mode-common-hook ()
;;  (setq c-basic-offset 4)
;;  (c-set-offset 'substatement-open 0))
;; (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; (defun my-org-mode-hook ()
;;   (visual-line-mode))
;; (add-hook 'org-mode-hook 'my-org-mode-hook)

                                        ; fixes
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

                                        ; common files
;; (set-register ?e user-init-file)

					; key bindings
(global-set-key (kbd "C-x C-b") 'buffer-menu-other-window)

                                        ; packages
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

(use-package saveplace
  :config
  ;; (setq save-place-file "~/.emacs.d/saveplace")
  (save-place-mode t))

(use-package bookmark)
  ;; :init
  ;; (setq bookmark-default-file "~/.emacs.d/bookmarks")
  ;; (setq bookmark-save-flag t))

(use-package mouse
  :config
  (xterm-mouse-mode t)
  (mouse-wheel-mode t))

(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t))

(use-package diminish
  :ensure t)

(use-package eldoc
  :diminish eldoc-mode
  :init
  (setq eldoc-idle-delay 0.1))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode))

;; (use-package evil-mc
;;   :ensure t
;;   :config
;;   (global-evil-mc-mode 1))

;; (defun my-company-tab ()
;;   (interactive)
;;   (if company-candidates
;;       (company-complete)
;;     (company-template-forward-field)))
(use-package company
  :ensure t
  :diminish company-mode
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (setq company-tooltip-align-annotations t)
  (global-company-mode)
  :bind
  (:map company-mode-map
        ("C-SPC" . company-complete)
        :map company-active-map
        ("<tab>" . company-complete)
        ("TAB" . company-complete)
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous)
        ("<return>" . nil)
        ("RET" . nil)
        ("C-w" . nil)
	:map company-template-nav-map
	("<tab>" . nil)
	("TAB" . nil)
	("M-n" . company-template-forward-field)))

;; (use-package yasnippet
;;   :ensure t
;;   :config
;;   (yas-global-mode 1)
;;   ;; :bind
;;   ;; (:map yas-minor-mode-map
;;   ;; 	("<tab>" . nil)
;;   ;; 	("TAB" . nil)
;;   ;; 	("SPC" . yas-expand))
;;   )

(use-package flycheck
  :ensure t
  :config
  (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
  (global-flycheck-mode))

;; (use-package helm-config
;;   :ensure helm
;;   :config
;;   (global-set-key (kbd "M-x") 'helm-M-x)
;;   (global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
;;   (global-set-key (kbd "C-x C-f") 'helm-find-files)
;;   (helm-mode t))

(use-package dumb-jump
  :ensure t
  :config
  (setq dumb-jump-selector 'ivy)
  (dumb-jump-mode))

(use-package avy
  :ensure t
  :config
  (setq avy-keys '(?a ?o ?e ?u ?h ?t ?n ?s))
  (avy-setup-default)
  :bind
  (:map global-map
        ("M-g f" . avy-goto-line)
        ("M-g w" . avy-goto-word)))

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (ivy-mode 1)
  :bind
  (:map global-map
	("C-c C-r" . ivy-resume)
	;; :map ivy-minibuffer-map
	;; ("TAB" . ivy-insert-current))
	))

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

(use-package magit
  :ensure t
  :config
  (setq magit-completing-read-function 'ivy-completing-read)
  :bind
  (:map global-map
        ("C-x g" . magit-status)))

(use-package projectile
  :ensure t
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-on))

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

;; (use-package auctex
;;   :ensure t
;;   :init
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)
;;   ;; (setq-default TeX-master nil)
;;   )

(use-package company-auctex
  :ensure t
  :config
  (company-auctex-init))

(use-package ess
  :ensure t
  :init
  (setq ess-eval-visibly nil))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode t))

;; (use-package evil-leader
;;   :ensure t
;;   :config
;;   (global-evil-leader-mode)
;;   (evil-leader/set-leader ",")
;;   (evil-leader/set-key "e" 'find-file))

(use-package evil
  :ensure t
  :init
  (setq evil-flash-delay 5)
  (setq evil-split-window-below t)
  (setq evil-symbol-word-search t)
  (setq evil-vsplit-window-right t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-Y-yank-to-eol t)
  ;; (setq evil-shift-round t)
  :config
  (evil-define-key 'normal emacs-lisp-mode-map
    (kbd "K") 'elisp-slime-nav-describe-elisp-thing-at-point)
  (evil-define-key 'normal dired-mode-map
    (kbd "h") 'dired-up-directory)
  (evil-define-key 'normal dired-mode-map
    (kbd "l") 'dired-find-alternate-file)
  (evil-mode t)
  :bind
  (:map evil-normal-state-map
        ("j" . evil-next-visual-line)
        ("k" . evil-previous-visual-line)
        ("$" . evil-end-of-visual-line)
        ("^" . evil-first-non-blank-of-visual-line)
        ("RET" . save-buffer)
        ("-" . evil-delete-buffer)
        ("H" . evil-prev-buffer)
        ("L" . evil-next-buffer)
	("C-u" . evil-scroll-up)
	("C-d" . evil-scroll-down)
        :map evil-visual-state-map
        ("j" . evil-next-visual-line)
        ("k" . evil-previous-visual-line)
        ("$" . evil-end-of-visual-line)
        ("^" . evil-first-non-blank-of-visual-line)
        ))

;; (defun backward-delete-word (arg)
;;   (interactive "p")
;;   (delete-region (point) (progn (backward-word arg) (point))))
;; (define-key minibuffer-local-map (kbd "C-w") 'backward-delete-word)

;; end
(put 'dired-find-alternate-file 'disabled nil)

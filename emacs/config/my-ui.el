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
  :custom
  (blink-cursor-blinks 0)
  :config
  (blink-cursor-mode 1))

(use-package display-line-numbers
  :when (boundp 'display-line-numbers)
  :defer t
  :hook ((text-mode prog-mode conf-mode) . display-line-numbers-mode)
  :custom
  (display-line-numbers-grow-only t)
  (display-line-numbers-type 'visual))

(use-package hl-line
  :custom
  (global-hl-line-sticky-flag t)
  :config
  (global-hl-line-mode t))

(use-package paren
  :custom
  (show-paren-delay 0)
  :config
  (show-paren-mode 1))

(use-package mouse
  :bind
  (;; ("<down-mouse-1>" . nil)
   ("<drag-mouse-1>" . nil)))

(use-package xt-mouse
  :config
  (xterm-mouse-mode 1))

(use-package mwheel
  :custom
  (mouse-wheel-progressive-speed nil)
  :config
  (mouse-wheel-mode 1))

(use-package buff-menu
  :defer t
  :bind
  (("C-x C-b" . buffer-menu)))

(use-package dired
  :defer t)

(use-package term
  :defer t
  :init
  (defun my-term-mode-hook ()
    (setq-local global-hl-line-mode nil)
    (setq-local scroll-margin 0))
  :hook (term-mode . my-term-mode-hook))

(use-package gdb-mi
  :defer t
  :commands gdb
  :custom
  (gdb-many-windows t))

(use-package browse-url
  :custom
  (browse-url-browser-function
   (cond
    ((executable-find "firefox") 'browse-url-firefox)
    ((executable-find "chromium") 'browse-url-chromium)
    (t 'browse-url-default-browser))))

(use-package autothemer
  :ensure t
  :config
  (add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))
  (load-theme 'code t))

(use-package nlinum
  :unless (boundp 'display-line-numbers)
  :ensure t
  :defer t
  :hook ((text-mode prog-mode conf-mode) . nlinum-mode)
  :custom
  (nlinum-format " %d ")
  (nlinum-highlight-current-line t))

(use-package adaptive-wrap
  :ensure t
  :defer t
  :hook (visual-line-mode . adaptive-wrap-prefix-mode))

(use-package highlight-numbers
  :ensure t
  :defer t
  :hook (prog-mode . highlight-numbers-mode))

(use-package paradox
  :ensure t
  :defer t
  :custom
  (paradox-execute-asynchronously t)
  (paradox-github-token t))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :custom
  (undo-tree-auto-save-history t)
  (undo-tree-enable-undo-in-region nil)
  (undo-tree-history-directory-alist
   `((".*" . ,(expand-file-name "undo-history/" user-emacs-directory))))
  :config
  (global-undo-tree-mode 1))

(use-package shackle
  :ensure t
  :custom
  (shackle-rules '())
  ;; (shackle-default-rule '(:select t))
  :config
  (shackle-mode 1))

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :custom
  (ivy-count-format "%d/%d ")
  (ivy-extra-directories '())
  (ivy-format-functions-alist
   '((t . ivy-format-function-arrow)))
  (ivy-use-selectable-prompt t)
  (ivy-use-virtual-buffers t)
  :config
  (ivy-mode 1)
  :bind
  (:map ivy-minibuffer-map
   ("<escape>" . minibuffer-keyboard-quit)
   ("TAB" . ivy-partial)
   ("C-u" . ivy-scroll-down-command)
   ("C-d" . ivy-scroll-up-command)
   ("C-w" . ivy-backward-kill-word)))

(use-package ivy-hydra
  :ensure t)

(use-package counsel
  :ensure t
  :diminish counsel-mode
  :config
  (counsel-mode 1)
  :bind
  (("C-c b" . counsel-projectile-switch-to-buffer)
   ("C-c d" . counsel-projectile-find-dir)
   ("C-c f" . counsel-projectile-find-file)
   ("C-c s" . counsel-projectile-rg)
   ("C-c p" . counsel-projectile-switch-project)
   ("C-x b" . counsel-switch-buffer)
   ("C-x d" . counsel-dired)))

(use-package swiper
  :ensure t
  :defer t
  :bind
  (("C-s" . swiper)))

(use-package avy
  :ensure t
  :defer t
  :custom
  (avy-keys (number-sequence ?a ?z))
  :bind
  (("M-g j" . avy-goto-line-below)
   ("M-g k" . avy-goto-line-above)
   ("M-g l" . avy-goto-line)
   ("M-g w" . avy-goto-word)
   ("M-g c" . avy-goto-char-timer)))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode 1))

(use-package elfeed
  :ensure t
  :defer t
  :custom
  (elfeed-search-filter "@6-months-ago")
  :bind
  (("C-x w" . elfeed)))

(provide 'my-ui)

;; end

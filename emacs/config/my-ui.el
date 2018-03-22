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

(use-package xt-mouse
  :config
  (xterm-mouse-mode 1))

(use-package mwheel
  :config
  (mouse-wheel-mode 1))

(use-package buff-menu
  :defer t
  :bind
  (("C-x C-b" . buffer-menu)))

(use-package dired
  :defer t
  :bind
  (("C-x d" . dired)))

(use-package gdb-mi
  :defer t
  :commands gdb
  :custom
  (gdb-many-windows t))

(use-package browse-url
  :custom
  (browse-url-browser-function
   (cond
    ((or (executable-find "chromium") (executable-find "chromium-browser"))
     'browse-url-chromium)
    (t 'browse-url-default-browser))))

(use-package autothemer
  :ensure t
  :config
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
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
  (undo-tree-history-directory-alist '((".*" . "~/.emacs.d/undo-history/")))
  :config
  (global-undo-tree-mode))

(use-package shackle
  :ensure t
  :custom
  (shackle-rules '())
  (shackle-default-rule '(:select t))
  :config
  (shackle-mode))

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-count-format "%d/%d ")
  (ivy-format-function 'ivy-format-function-arrow)
  :config
  (ivy-mode 1)
  :bind
  (("C-c C-r" . ivy-resume)
   :map ivy-minibuffer-map
   ("<escape>" . keyboard-escape-quit)
   ("C-w" . ivy-backward-kill-word)))

(use-package ivy-hydra
  :ensure t)

(use-package counsel
  :ensure t
  :defer t
  :bind
  (("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("C-h f" . counsel-describe-function)
   ("C-h v" . counsel-describe-variable)
   ("C-c g" . counsel-git)
   ("C-c k" . counsel-ag)
   ("C-x l" . counsel-locate)))

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

(provide 'my-ui)

;; end

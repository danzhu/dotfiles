(use-package simple
  :diminish visual-line-mode
  :config
  (global-visual-line-mode 1)
  (line-number-mode -1)
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
  :custom
  (blink-cursor-blinks 0)
  :config
  (blink-cursor-mode 1))

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
  :bind
  (("C-x C-b" . buffer-menu-other-window)))

(use-package autothemer
  :ensure t
  :config
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
  (load-theme 'code t))

(use-package nlinum
  :ensure t
  :custom
  (nlinum-format " %d ")
  (nlinum-highlight-current-line t)
  :config
  (dolist (hook '(text-mode-hook prog-mode-hook conf-mode-hook))
    (add-hook hook
              (lambda () (nlinum-mode 1)))))

(use-package paradox
  :ensure t
  :defer t
  :functions paradox-enable
  :custom
  (paradox-execute-asynchronously t))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :custom
  (undo-tree-auto-save-history t)
  (undo-tree-enable-undo-in-region nil)
  (undo-tree-history-directory-alist '((".*" . "~/.emacs.d/undo-history/")))
  :config
  (global-undo-tree-mode))

(use-package ivy
  :ensure t
  :demand t
  :diminish ivy-mode
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-count-format "%d/%d ")
  (ivy-format-function 'ivy-format-function-arrow)
  :config
  (ivy-mode 1)
  :bind
  (("C-c C-r" . ivy-resume)))

(use-package ivy-hydra
  :ensure t)

(use-package counsel
  :ensure t
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
  :bind
  (("C-s" . swiper)))

(use-package avy
  :ensure t
  :custom
  (avy-keys (number-sequence ?a ?z))
  :bind
  (("M-g j" . avy-goto-line-below)
   ("M-g k" . avy-goto-line-above)
   ("M-g l" . avy-goto-line)
   ("M-g w" . avy-goto-word)
   ("M-g c" . avy-goto-char-timer)))

(provide 'my-ui)
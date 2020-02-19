(use-package projectile
  :ensure t
  :diminish projectile-mode
  :custom
  (projectile-completion-system 'ivy)
  :config
  (customize-set-variable
   'projectile-globally-ignored-directories
   (append '("~/.local") projectile-globally-ignored-directories))
  (projectile-mode 1))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode 1))

;; (use-package persp-mode
;;   :ensure t
;;   :config
;;   (persp-mode 1))

(use-package magit
  :ensure t
  :defer t
  :custom
  (magit-completing-read-function 'ivy-completing-read)
  :bind
  (("C-x g" . magit-status)))

(use-package fringe-helper
  :ensure t)

(use-package git-gutter-fringe
  :ensure t
  :diminish git-gutter-mode
  :when (or (display-graphic-p) (daemonp))
  :config
  (global-git-gutter-mode 1)
  (add-hook 'focus-in-hook 'git-gutter:update-all-windows)
  (fringe-helper-define 'git-gutter-fr:added '(center repeated)
    "....XXXX")
  (fringe-helper-define 'git-gutter-fr:modified '(center repeated)
    "....XXXX")
  (fringe-helper-define 'git-gutter-fr:deleted 'bottom
    "XXXXXXXX"
    "XXXXXXXX"
    "XXXXXXXX"
    "XXXXXXXX"))

(use-package rg
  :ensure t)

(provide 'my-project)

;; end

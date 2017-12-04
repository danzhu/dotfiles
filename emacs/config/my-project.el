(use-package projectile
  :ensure t
  :diminish projectile-mode
  :custom
  (projectile-completion-system 'ivy)
  :config
  (projectile-mode 1))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-on))

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

(use-package ag
  :ensure t)

(provide 'my-project)

;; end

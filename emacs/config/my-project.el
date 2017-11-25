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
  :custom
  (projectile-completion-system 'ivy)
  :config
  (projectile-mode))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-on))

(use-package magit
  :ensure t
  :custom
  (magit-completing-read-function 'ivy-completing-read)
  :bind
  (("C-x g" . magit-status)))

(provide 'my-project)

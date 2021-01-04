(use-package projectile
  :ensure t
  :diminish projectile-mode
  :init
  (defun my-ignore-project-p (p)
    (s-prefix? (expand-file-name "~/.local/share/pikaur/aur_repos") p))
  :custom
  (projectile-completion-system 'ivy)
  (projectile-ignored-project-function #'my-ignore-project-p)
  :config
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
  ;; TODO: find way to update on active window change
  (add-hook 'focus-in-hook 'git-gutter:update-all-windows)
  (fringe-helper-define 'git-gutter-fr:added '(center repeated)
    "......XX")
  (fringe-helper-define 'git-gutter-fr:modified '(center repeated)
    "......XX")
  (fringe-helper-define 'git-gutter-fr:deleted 'bottom
    "XXXXXXXX"
    "XXXXXXXX"))

(use-package rg
  :ensure t)

(provide 'my-project)

;; end

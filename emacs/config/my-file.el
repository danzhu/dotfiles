(use-package autorevert
  :diminish auto-revert-mode
  :config
  (global-auto-revert-mode 1))

(use-package saveplace
  :config
  (save-place-mode t))

(use-package savehist
  :config
  (savehist-mode 1))

(use-package jka-cmpr-hook
  :config
  (auto-compression-mode 1))

(use-package vc-hooks
  :custom
  (vc-follow-symlinks t))

(use-package recentf
  :custom
  (recentf-max-saved-items 100))

(use-package files
  :custom
  (make-backup-files nil)
  (save-abbrevs nil)
  (require-final-newline t)
  (auto-save-file-name-transforms
   `((".*" ,(expand-file-name "auto-save-list/" user-emacs-directory) t))))

(provide 'my-file)

;; end

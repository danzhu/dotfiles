(use-package evil
  :ensure t
  :custom
  (evil-echo-state nil)
  (evil-ex-substitute-global t)
  (evil-flash-delay 5)
  (evil-split-window-below t)
  (evil-symbol-word-search t)
  (evil-vsplit-window-right t)
  (evil-want-C-u-scroll t)
  (evil-want-Y-yank-to-eol t)
  (evil-want-change-word-to-end nil)

  :config
  (setq evil-normal-state-tag (propertize "<N>" 'face 'font-lock-keyword-face))
  (setq evil-visual-state-tag (propertize "<V>" 'face 'font-lock-type-face))
  (setq evil-insert-state-tag (propertize "<I>" 'face 'font-lock-constant-face))
  (setq evil-replace-state-tag (propertize "<R>" 'face 'font-lock-variable-name-face))
  (setq evil-motion-state-tag (propertize "<M>" 'face 'font-lock-string-face))
  (setq evil-operator-state-tag (propertize "<O>" 'face 'font-lock-preprocessor-face))
  (setq evil-emacs-state-tag (propertize "<E>" 'face 'font-lock-function-name-face))

  (evil-mode 1)

  (evil-define-key 'motion Buffer-menu-mode-map
    (kbd "r") 'revert-buffer)

  ;; TODO: fix mouse click
  (evil-set-initial-state 'Custom-mode 'motion)
  (evil-define-key 'motion Custom-mode-map
    (kbd "TAB") 'widget-forward
    (kbd "<backtab>") 'widget-backward)

  (evil-set-initial-state 'dired-mode 'motion)
  (evil-define-key 'motion dired-mode-map
    (kbd "!") 'dired-do-shell-command
    (kbd "#") 'dired-flag-auto-save-files
    (kbd "T") 'dired-do-touch
    (kbd "W") 'browse-url-of-dired-file
    (kbd "j") 'dired-next-line
    (kbd "k") 'dired-previous-line
    (kbd "r") 'revert-buffer)

  (evil-define-key 'normal emacs-lisp-mode-map
    (kbd "K") 'elisp-slime-nav-describe-elisp-thing-at-point)

  (evil-set-initial-state 'paradox-menu-mode 'motion)
  (evil-define-key 'motion paradox-menu-mode-map
    (kbd "F") 'paradox-menu-filter
    (kbd "j") 'paradox-next-entry
    (kbd "k") 'paradox-previous-entry)

  (evil-set-initial-state 'term-mode 'emacs)

  :bind
  (("M-l" . evil-next-buffer)
   ("M-h" . evil-prev-buffer)
   ("M--" . evil-delete-buffer)
   ("M-j" . nil)
   ("M-k" . nil)

   :map evil-motion-state-map
   ("'" . evil-goto-mark)
   ("`" . evil-goto-mark-line)
   ("$" . evil-end-of-visual-line)
   ("^" . evil-first-non-blank-of-visual-line)
   ("j" . next-line)
   ("k" . previous-line)
   ("+" . nil)
   ("-" . nil)
   ("H" . nil)
   ("L" . nil)
   ("M" . nil)
   ("SPC" . nil)
   ("RET" . nil)
   ("C-e" . nil)

   :map evil-normal-state-map
   ("RET" . save-buffer)
   ("C-p" . counsel-projectile)
   ("M-." . nil)

   :map evil-operator-state-map
   ("'" . evil-goto-mark-line)
   ("`" . evil-goto-mark)
   ("$" . evil-end-of-line)
   ("^" . evil-first-non-blank)
   ("j" . evil-next-line)
   ("k" . evil-previous-line)

   :map evil-insert-state-map
   ("C-a" . nil)
   ("C-e" . nil)))

(use-package evil-surround
  :ensure t
  :after evil
  :config
  (global-evil-surround-mode t))

(use-package evil-commentary
  :ensure t
  :after evil
  :diminish evil-commentary-mode
  :config
  (evil-commentary-mode))

(use-package evil-visualstar
  :ensure t
  :after evil
  :config
  (global-evil-visualstar-mode))

(use-package evil-exchange
  :ensure t
  :after evil
  :config
  (evil-exchange-install))

(use-package evil-magit
  :ensure t
  :after (evil magit)
  :custom
  (evil-magit-state 'motion))

(use-package evil-multiedit
  :ensure t
  :after evil
  :config
  (evil-multiedit-default-keybinds))

(provide 'my-evil)

;; end

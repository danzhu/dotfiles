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
  (evil-set-initial-state 'Custom-mode 'motion)
  (evil-set-initial-state 'paradox-menu-mode 'motion)
  (evil-set-initial-state 'term-mode 'emacs)
  (evil-define-key 'normal emacs-lisp-mode-map
    (kbd "K") 'elisp-slime-nav-describe-elisp-thing-at-point)
  (evil-define-key 'normal dired-mode-map
    (kbd "h") 'dired-up-directory
    (kbd "l") 'dired-find-alternate-file)
  :bind
  (("M-l" . evil-next-buffer)
   ("M-h" . evil-prev-buffer)
   ("M-j" . nil)
   ("M-k" . nil)
   ("M--" . evil-delete-buffer)
   :map evil-normal-state-map
   ("RET" . save-buffer)
   ("C-p" . counsel-projectile)
   ("M-." . nil)
   :map evil-motion-state-map
   ("j" . next-line)
   ("k" . previous-line)
   ("$" . evil-end-of-visual-line)
   ("^" . evil-first-non-blank-of-visual-line)
   ("'" . evil-goto-mark)
   ("`" . evil-goto-mark-line)
   ("SPC" . nil)
   ("RET" . nil)
   ("C-e" . nil)
   ;; ("<down-mouse-1>" . nil)
   ;; ("<down-mouse-3>" . nil)
   :map evil-insert-state-map
   ("C-a" . nil)
   ("C-e" . nil)))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode t))

(use-package evil-commentary
  :ensure t
  :diminish evil-commentary-mode
  :config
  (evil-commentary-mode))

(use-package evil-visualstar
  :ensure t
  :config
  (global-evil-visualstar-mode))

(use-package evil-exchange
  :ensure t
  :config
  (evil-exchange-install))

(provide 'my-evil)

;; end

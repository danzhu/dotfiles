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
  (evil-mode 1)
  (evil-define-key 'normal emacs-lisp-mode-map
    (kbd "K") 'elisp-slime-nav-describe-elisp-thing-at-point)
  (evil-set-initial-state 'dired-mode 'motion)
  (evil-set-initial-state 'paradox-menu-mode 'motion)
  (evil-set-initial-state 'term-mode 'emacs)
  :bind
  (("M-l" . evil-next-buffer)
   ("M-h" . evil-prev-buffer)
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

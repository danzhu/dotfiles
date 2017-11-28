(use-package evil
  :ensure t
  :demand t
  :defines evil-want-Y-yank-to-eol
  :functions evil-delay evil-set-initial-state
  :custom
  (evil-echo-state nil)
  (evil-ex-substitute-global t)
  (evil-flash-delay 5)
  (evil-split-window-below t)
  (evil-symbol-word-search t)
  (evil-vsplit-window-right t)
  (evil-want-C-u-scroll t)
  (evil-want-Y-yank-to-eol t)
  :config
  (evil-mode 1)
  (evil-define-key 'normal emacs-lisp-mode-map
    (kbd "K") 'elisp-slime-nav-describe-elisp-thing-at-point)
  (evil-define-key 'normal dired-mode-map
    (kbd "h") 'dired-up-directory)
  (evil-define-key 'normal dired-mode-map
    (kbd "l") 'dired-find-alternate-file)
  (evil-set-initial-state 'paradox-menu-mode 'motion)
  (evil-set-initial-state 'term-mode 'emacs)
  :bind
  (:map evil-normal-state-map
        ("RET" . save-buffer)
        ("C-p" . counsel-projectile)
        ("M-." . nil)
        :map evil-motion-state-map
        ("j" . next-line)
        ("k" . previous-line)
        ("$" . evil-end-of-visual-line)
        ("^" . evil-first-non-blank-of-visual-line)
        ("SPC" . nil)))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode t))

(use-package evil-commentary
  :ensure t
  :diminish evil-commentary-mode
  :config
  (evil-commentary-mode))

(provide 'my-evil)
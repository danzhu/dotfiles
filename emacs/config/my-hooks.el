(defun my-prog-mode-hook ()
  (font-lock-add-keywords
   nil
   '(("\\<\\(TODO\\|FIXME\\|XXX\\|HACK\\):" 1 highlight t))))
(add-hook 'prog-mode-hook 'my-prog-mode-hook)

(defun my-term-mode-hook ()
  (setq-local global-hl-line-mode nil)
  (setq-local scroll-margin 0))
(add-hook 'term-mode-hook 'my-term-mode-hook)

(provide 'my-hooks)
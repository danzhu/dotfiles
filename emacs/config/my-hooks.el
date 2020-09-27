(defun my-prog-mode-hook ()
  (setq-local comment-column 40)
  ;; (font-lock-add-keywords
  ;;  nil
  ;;  '(("\\<\\(TODO\\|FIXME\\|XXX\\|NOTE\\|HACK\\):" 1 highlight t)))
  )
(add-hook 'prog-mode-hook 'my-prog-mode-hook)

(provide 'my-hooks)

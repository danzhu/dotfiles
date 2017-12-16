(use-package powerline
  :ensure t)

(use-package spaceline
  :ensure t
  :after powerline)

(use-package spaceline-segments
  :after spaceline
  :functions spaceline-compile
  :custom
  (mode-line-format '("%e" (:eval (spaceline-ml-main))))
  :config
  (spaceline-define-segment my-buffer-relative-path
    "buffer path relative to project root"
    (when (and (projectile-project-p) buffer-file-truename)
      (file-relative-name (file-name-directory buffer-file-truename)
                          (projectile-project-root)))
    :tight t)

  (spaceline-define-segment my-vc
    "shortened version control information"
    (when (and vc-mode buffer-file-name)
      (s-chop-prefix (symbol-name (vc-backend buffer-file-name))
                     (s-trim (format-mode-line '(vc-mode vc-mode))))))

  (spaceline-define-segment my-evil-state
    "evil mode line tag"
    (when evil-mode
      (s-trim evil-mode-line-tag)))

  (spaceline-define-segment my-flycheck
    "flycheck warnings and errors"
    (when (boundp 'flycheck-last-status-change)
      ;; lazily create menu map
      (unless (boundp 'my-flycheck-menu-map)
        (defvar my-flycheck-menu-map
          (let ((map (make-sparse-keymap)))
            (define-key map [mode-line mouse-1] flycheck-mode-menu-map)
            map)))
      (propertize
       (pcase flycheck-last-status-change
         ('not-checked "")
         ('no-checker "")
         ('running ":|")
         ('errored (propertize ":X" 'face 'error))
         ('finished
          (let-alist (flycheck-count-errors flycheck-current-errors)
            (cond
             (.error (propertize (format ":[ %s" .error) 'face 'error))
             (.warning (propertize (format ":/ %s" .warning) 'face 'warning))
             (t (propertize ":]" 'face 'success)))))
         ('interrupted (propertize "interrupt" 'face 'warning))
         ('suspicious (propertize "suspicious" 'face 'error)))
       'mouse-face 'mode-line-highlight
       'help-echo "FlyCheck\nmouse-1: FlyCheck menu"
       'local-map my-flycheck-menu-map)))

  (spaceline-define-segment my-line-ending
    "current file line ending"
    (mode-line-eol-desc))

  (spaceline-define-segment my-narrow
    "narrow indicator"
    (powerline-narrow))

  (spaceline-compile
    `((buffer-modified ((my-buffer-relative-path buffer-id) :separator ""))
      (projectile-root my-vc)
      ((my-line-ending my-flycheck) :face line-face))
    `(((selection-info my-narrow line ":" column my-evil-state) :face line-face)
      (minor-modes global)
      (major-mode process))))

(provide 'my-modeline)

;; startup
(customize-set-variable 'inhibit-startup-screen t)
(customize-set-variable 'initial-major-mode 'fundamental-mode)
(customize-set-variable 'initial-scratch-message nil)

;; display
(customize-set-variable 'echo-keystrokes 0.1)
(customize-set-variable 'eol-mnemonic-dos "CRLF")
(customize-set-variable 'eol-mnemonic-mac "CR")
(customize-set-variable 'eol-mnemonic-unix "LF")
(customize-set-variable 'ring-bell-function 'ignore)
(customize-set-variable 'scroll-conservatively 100)
(customize-set-variable 'scroll-margin 5)
(customize-set-variable 'scroll-preserve-screen-position t)
(customize-set-variable 'scroll-step 1)
(customize-set-variable 'use-dialog-box nil)
(setq frame-title-format '("%b"))
(setq-default fringes-outside-margins t)

;; editing
(customize-set-variable 'fill-column 80)
(customize-set-variable 'indent-tabs-mode nil)
(customize-set-variable 'tab-width 4)

;; editor
(customize-set-variable 'gc-cons-threshold (* 256 1024 1024))
(defalias 'yes-or-no-p 'y-or-n-p)

;; keys
(bind-key "M-h" 'previous-buffer)
(bind-key "M-l" 'next-buffer)
(bind-key "M--" (lambda ()
                  (interactive)
                  (kill-buffer)))

(provide 'my-settings)

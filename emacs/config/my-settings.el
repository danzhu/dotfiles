;; startup
(customize-set-variable 'inhibit-startup-screen t)
(customize-set-variable 'initial-major-mode 'fundamental-mode)
(customize-set-variable 'initial-scratch-message nil)

(defalias 'display-startup-echo-area-message 'ignore)

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
(setq auto-window-vscroll nil)
(setq frame-title-format '("%b"))
(setq-default fringes-outside-margins t)

;; editing
(customize-set-variable 'fill-column 80)
(customize-set-variable 'indent-tabs-mode nil)
(customize-set-variable 'sentence-end-double-space nil)
(customize-set-variable 'tab-always-indent nil)
(customize-set-variable 'tab-width 4)

;; editor
;; (customize-set-variable 'focus-follows-mouse t)
(customize-set-variable 'gc-cons-percentage 0.5)
(customize-set-variable 'gc-cons-threshold (* 256 1024 1024))
(customize-set-variable 'mouse-autoselect-window t)
(defalias 'yes-or-no-p 'y-or-n-p)

;; features
(dolist (feature '(dired-find-alternate-file
                   narrow-to-region))
  (put feature 'disabled nil))

(provide 'my-settings)

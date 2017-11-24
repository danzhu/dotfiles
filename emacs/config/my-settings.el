;; startup
(setq inhibit-startup-screen t)
(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message nil)

;; display
(setq echo-keystrokes 0.1)
(setq eol-mnemonic-dos "CRLF")
(setq eol-mnemonic-mac "CR")
(setq eol-mnemonic-unix "LF")
(setq frame-title-format '("%b"))
(setq ring-bell-function 'ignore)
(setq scroll-conservatively 100)
(setq scroll-margin 5)
(setq scroll-preserve-screen-position t)
(setq scroll-step 1)
(setq use-dialog-box nil)
(setq-default fringes-outside-margins t)

;; editing
(setq-default fill-column 80)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; files
(setq make-backup-files nil)
(setq save-abbrevs nil)
(setq-default require-final-newline t)
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save-list/" t)))

;; editor
(setq gc-cons-threshold (* 16 1024 1024))
(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'my-settings)

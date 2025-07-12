;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "{{name}}"
      user-mail-address "{{email}}")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'code)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; emacs
(setq! focus-follows-mouse t
       ;; mouse-autoselect-window t
       mouse-wheel-progressive-speed nil
       mouse-wheel-scroll-amount '(5 ((shift) . hscroll))
       scroll-margin 5)
(setq! browse-url-browser-function #'browse-url-firefox)

;; doom
(setq! +lookup-provider-url-alist '())
;; (dolist (hook '(;; python-mode-hook
;;                 typescript-mode-hook
;;                 typescript-tsx-mode-hook
;;                 js2-mode-hook
;;                 yaml-mode-hook
;;                 json-mode-hook))
;;   (setq-hook! hook +format-with-lsp nil))

;; indent-guides
(setq! highlight-indent-guides-auto-enabled nil
       highlight-indent-guides-responsive 'top)

;; flycheck
;; (after! flycheck-popup-tip
;;   (setq! flycheck-popup-tip-error-prefix "- "))

;; company
(after! company
  (setq! company-idle-delay 0.1)
  (map! :map company-active-map
        :after company
        "<tab>" #'company-complete-selection
        "TAB" #'company-complete-selection
        "<return>" nil
        "RET" nil
        "C-h" nil
        "M-n" nil
        "M-p" nil))

;; corfu
(setq! +corfu-want-ret-to-confirm 'both)
(after! corfu
  (map! :map corfu-map
        "C-e" #'corfu-insert))

;; yasnippets
(map! :map yas-keymap
      :after yasnippet
      "M-SPC" #'yas-expand
      "M-n" #'yas-next-field
      "M-p" #'yas-prev-field
      "<tab>" nil
      "TAB" nil
      "<backtab>" nil
      "S-TAB" nil)

;; evil
(setq! evil-echo-state nil
       evil-ex-substitute-global t
       ;; evil-move-cursor-back nil
       ;; evil-split-window-below t
       ;; evil-vsplit-window-right t
       evil-want-change-word-to-end nil)
(map! :nv "s" #'evil-surround-region
      :nv "S" #'evil-Surround-region
      :o "s" #'evil-surround-edit
      :o "S" #'evil-Surround-edit)

;; extra keys
(defun buffer-writable-filter (cmd)
  (unless buffer-read-only
    cmd))
(map! :map general-override-mode-map
      :n "RET" '(menu-item "" save-buffer :filter buffer-writable-filter))

;; lsp
(after! lsp-mode
  (setq! lsp-enable-file-watchers nil
         lsp-headerline-breadcrumb-enable t
         lsp-headerline-breadcrumb-segments '(symbols)
         lsp-headerline-breadcrumb-enable-diagnostics nil
         ;; lsp-lens-enable nil
         lsp-lens-place-position 'above-line))
(after! lsp-ui
  (setq! lsp-ui-doc-border "dim gray"
         lsp-ui-doc-enable t
         lsp-ui-doc-include-signature t
         lsp-ui-doc-max-height 20
         lsp-ui-doc-max-width 80
         lsp-ui-doc-position 'top
         ;; lsp-ui-doc-show-with-cursor t
         ;; lsp-ui-sideline-show-hover t
         ))
(after! lsp-diagnostics
  (setq! lsp-diagnostics-attributes
         `((unnecessary :inherit 'font-lock-comment-face)
           (deprecated  :strike-through t))))
(after! lsp-haskell
  (setq! lsp-haskell-plugin-stan-global-on nil))
(setq! lsp-pyright-multi-root nil)

;; tree-sitter
;; https://github.com/emacs-tree-sitter/elisp-tree-sitter/issues/155
(define-advice tree-sitter-langs--hl-query-path
    (:before-until (lang-symbol &optional mode) override-default-patterns)
  (pcase lang-symbol
    ('haskell "~/.dotfiles/doom/tree-sitter/haskell.scm")))

;; tabs
;; (setq! centaur-tabs-set-bar 'over)
(setq! centaur-tabs-buffer-groups-function #'centaur-tabs-projectile-buffer-groups)

;; global modes
(global-subword-mode +1)
;; NOTE: disabled due to performance issues in rust
;; (+global-word-wrap-mode +1)
(global-display-fill-column-indicator-mode +1)

;; lang modes
(add-to-list 'auto-mode-alist '("\\.in\\'" . text-mode))
(add-to-list 'auto-mode-alist '("\\.out\\'" . text-mode))

(setq-hook! 'haskell-mode-hook
  +format-with 'ormolu)

(setq-hook! 'sql-mode-hook
  sql-product 'sqlite)

;; interactive functions
(defun +sort-words ()
  "Sort words in region."
  (interactive)
  (sort-regexp-fields nil "\\_<.*?\\_>" "" (point) (mark)))

;; end

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "{{name}}"
      user-mail-address "{{email}}")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "{{font_mono}}" :size 12)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 12))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'code)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
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
(setq-hook! 'python-mode-hook +format-with-lsp nil)
(setq-hook! 'typescript-mode-hook +format-with-lsp nil)
(setq-hook! 'typescript-tsx-mode-hook +format-with-lsp nil)
(setq-hook! 'js2-mode-hook +format-with-lsp nil)
(setq-hook! 'yaml-mode-hook +format-with-lsp nil)
(setq-hook! 'json-mode-hook +format-with-lsp nil)

;; flycheck
(after! flycheck-popup-tip
  (setq! flycheck-popup-tip-error-prefix "- "))

;; company
(setq! company-idle-delay 0.1)
(map! :map company-active-map
      :after company
      "<tab>" #'company-complete-selection
      "TAB" #'company-complete-selection
      "<return>" nil
      "RET" nil
      "C-h" nil
      "M-n" nil
      "M-p" nil)

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
(setq! lsp-enable-file-watchers nil
       lsp-lens-enable nil)
(after! lsp-ui
  (setq! lsp-ui-doc-border "dim gray"
         lsp-ui-doc-enable t
         lsp-ui-doc-include-signature t
         lsp-ui-doc-max-height 20
         lsp-ui-doc-max-width 80
         lsp-ui-doc-position 'bottom))
(setq! lsp-diagnostics-attributes
       `((unnecessary :inherit 'font-lock-comment-face)
         (deprecated  :strike-through t)))

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

;; interactive functions
(defun +sort-words ()
  "Sort words in region."
  (interactive)
  (sort-regexp-fields nil "\\_<.*?\\_>" "" (point) (mark)))

;; end

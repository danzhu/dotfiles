(require 'autothemer)

(autothemer-deftheme
 code "Code"

 ((((class color) (min-colors #xFFFFFF))
   ((class color) (min-colors #xF)))

  (code-fg "#{{foreground}}" "unspecified-fg")
  (code-bg "#{{background}}" "unspecified-bg")
  (code-darker "#{{black}}" "black")
  (code-red "#{{red}}" "red")
  (code-green "#{{green}}" "green")
  (code-yellow "#{{yellow}}" "yellow")
  (code-blue "#{{blue}}" "blue")
  (code-magenta "#{{magenta}}" "magenta")
  (code-cyan "#{{cyan}}" "cyan")
  (code-gray "#{{white}}" "white")
  (code-dark "#{{light_black}}" "brightblack")
  (code-light-red "#{{light_red}}" "brightred")
  (code-light-green "#{{light_green}}" "brightgreen")
  (code-light-yellow "#{{light_yellow}}" "brightyellow")
  (code-light-blue "#{{light_blue}}" "brightblue")
  (code-light-magenta "#{{light_magenta}}" "brightmagenta")
  (code-light-cyan "#{{light_cyan}}" "brightcyan")
  (code-white "#{{light_white}}" "brightwhite")
  )

 (
  ;; text
  (default (:foreground code-fg :background code-bg :family "{{font_mono}}" :height {{font_size}}0))
  (bold (:bold t))
  (italic (:italic t))
  (bold-italic (:bold t :italic t))
  (underline (:underline t))
  (fixed-pitch-serif ())
  (shadow (:foreground code-gray))
  (highlight (:foreground code-white :background code-dark :bold t))
  (link (:foreground code-light-blue :underline t))
  (link-visited (:foreground code-light-magenta :underline t))
  (escape-glyph (:foreground code-light-blue))

  (cursor (:background code-fg))
  (success (:foreground code-green))
  (warning (:foreground code-yellow))
  (error (:foreground code-red))
  (match (:background code-dark))

  ;; window
  (fringe nil)
  (window-divider (:foreground code-dark))
  (vertical-border (:foreground code-dark))
  (region (:background code-dark))
  (secondary-selection (:background code-darker))
  (hl-line (:background code-darker))
  (tooltip (:foreground code-fg :background code-darker))
  (minibuffer-prompt (:foreground code-light-blue))

  ;; menu
  (menu (:background code-darker))
  (tty-menu-enabled-face (:background code-darker))
  (tty-menu-disabled-face (:foreground code-gray :background code-darker))
  (tty-menu-selected-face (:background code-bg))

  ;; mode line
  (mode-line (:foreground code-light-blue :background code-darker))
  (mode-line-inactive (:foreground code-gray :background code-darker))
  (mode-line-buffer-id (:foreground code-white :bold t))
  (mode-line-buffer-id-inactive (:foreground code-fg))
  (mode-line-highlight (:foreground code-light-red))
  (mode-line-emphasis (:foreground code-light-green))

  ;; header line
  (header-line (:inherit 'mode-line :underline t))
  (header-line-highlight (:inherit 'highlight))

  ;; font lock
  (font-lock-builtin-face (:foreground code-magenta))
  (font-lock-comment-delimiter-face (:foreground code-dark))
  (font-lock-comment-face (:foreground code-gray))
  (font-lock-constant-face (:foreground code-light-green))
  (font-lock-function-name-face (:foreground code-light-magenta :bold t))
  (font-lock-keyword-face (:foreground code-light-blue))
  (font-lock-negation-char-face (:foreground code-light-blue :bold t))
  (font-lock-preprocessor-face (:foreground code-blue))
  (font-lock-string-face (:foreground code-light-yellow))
  (font-lock-type-face (:foreground code-light-cyan))
  (font-lock-variable-name-face (:foreground code-light-red))
  (font-lock-warning-face (:foreground code-yellow))

  ;; customize
  (custom-variable-tag (:foreground code-light-cyan :bold t))
  (custom-group-tag (:inherit 'variable-pitch :foreground code-light-cyan :height 1.2 :bold t))
  (custom-group-tag-1 (:inherit 'variable-pitch :foreground code-light-red :height 1.2 :bold t))
  (custom-comment-tag (:foreground code-light-yellow))
  (custom-comment (:background code-darker))
  (custom-state (:foreground code-green))
  (widget-field (:background code-darker))

  ;; line number
  (linum (:foreground code-gray :background code-bg :bold nil :italic nil :underline nil :strike-through nil))
  (line-number (:foreground code-gray :background code-bg :bold nil :italic nil :underline nil :strike-through nil))
  (line-number-current-line (:foreground code-fg :background code-darker :bold nil :italic nil :underline nil :strike-through nil))

  ;; show paren
  (show-paren-match (:foreground code-light-blue :background code-dark :bold t))
  (show-paren-match-expression (:inherit 'show-paren-match))
  (show-paren-mismatch (:foreground code-light-red :background code-dark :bold t))

  ;; isearch
  (isearch (:background code-dark))
  (isearch-fail (:foreground code-light-red :bold t))
  (lazy-highlight (:background code-dark))

  ;; eldoc
  (eldoc-highlight-function-argument (:foreground code-light-blue :bold t))

  ;; flyspell
  (flyspell-duplicate (:underline (:style 'wave :color code-yellow)))
  (flyspell-incorrect (:underline (:style 'wave :color code-red)))

  ;; term
  (term-color-black (:foreground code-darker :background code-darker))
  (term-color-red (:foreground code-light-red :background code-light-red))
  (term-color-green (:foreground code-light-green :background code-light-green))
  (term-color-yellow (:foreground code-light-yellow :background code-light-yellow))
  (term-color-blue (:foreground code-light-blue :background code-light-blue))
  (term-color-magenta (:foreground code-light-magenta :background code-light-magenta))
  (term-color-cyan (:foreground code-light-cyan :background code-light-cyan))
  (term-color-white (:foreground code-gray :background code-gray))
  (term-default-fg-color (:foreground code-fg))
  (term-default-bg-color (:foreground code-bg))

  ;; compilation
  (compilation-info (:foreground code-blue))
  (compilation-mode-line-fail (:inherit 'error))

  ;; sh mode
  (sh-heredoc (:inherit 'font-lock-string-face))

  ;; evil
  (evil-ex-info (:foreground code-light-blue :slant 'italic))
  (evil-ex-commands (:slant 'italic :underline t))
  (evil-ex-search (:inherit 'isearch))
  (evil-ex-lazy-highlight (:inherit 'lazy-highlight))
  (evil-ex-substitute-matches (:foreground code-light-red :background code-darker :bold t :strike-through t))
  (evil-ex-substitute-replacement (:foreground code-light-blue :background code-darker :bold t))

  ;; undo tree
  (undo-tree-visualizer-active-branch-face (:bold t))
  (undo-tree-visualizer-current-face (:foreground code-light-red))
  (undo-tree-visualizer-register-face (:foreground code-light-yellow))
  (undo-tree-visualizer-unmodified-face (:foreground code-light-cyan))

  ;; nlinum
  (nlinum-current-line (:foreground code-fg :background code-darker :bold nil :italic nil :underline nil :strike-through nil))

  ;; powerline
  (powerline-active1 (:foreground code-fg :background code-dark))
  (powerline-inactive1 (:foreground code-fg :background code-dark))
  (powerline-active2 (:foreground code-gray :background code-bg))
  (powerline-inactive2 (:foreground code-gray :background code-bg))

  ;; git gutter
  (git-gutter:added (:foreground code-green))
  (git-gutter:modified (:foreground code-yellow))
  (git-gutter:deleted (:foreground code-red))
  (git-gutter:unchanged (:background code-darker))
  (git-gutter:separator (:foreground code-darker))

  ;; git gutter fringe
  (git-gutter-fr:deleted (:inherit ('git-gutter:deleted 'fringe)))
  (git-gutter-fr:added (:inherit ('git-gutter:added 'fringe)))
  (git-gutter-fr:modified (:inherit ('git-gutter:modified 'fringe)))

  ;; highlight indentation
  (highlight-indentation-current-column-face (:background code-dark))
  (highlight-indentation-face (:background code-darker))

  ;; lsp-mode
  (lsp-face-highlight-read (:background code-dark))
  (lsp-face-highlight-textual (:background code-dark))
  (lsp-face-highlight-write (:background code-dark))

  ;; lsp-ui
  (lsp-ui-doc-background (:background code-bg))
  (lsp-ui-sideline-code-action (:foreground code-yellow))

  ;; company
  (company-template-field (:background code-dark))
  (company-echo nil)
  (company-echo-common (:foreground code-light-blue))
  (company-preview (:foreground code-fg :background code-bg))
  (company-preview-common (:foreground code-light-blue))
  (company-preview-search (:foreground code-blue :background code-darker))
  (company-scrollbar-bg (:background code-dark))
  (company-scrollbar-fg (:background code-gray))
  (company-tooltip (:background code-darker))
  (company-tooltip-selection (:background code-bg))
  (company-tooltip-common (:foreground code-gray))
  (company-tooltip-search (:foreground code-light-red))
  (company-tooltip-annotation (:foreground code-light-blue))
  (company-tooltip-mouse (:inherit 'company-tooltip-selection))
  (company-tooltip-common-selection (:inherit 'company-tooltip-common))
  (company-tooltip-search-selection (:inherit 'company-tooltip-search))
  (company-tooltip-annotation-selection (:inherit 'company-tooltip-annotation))

  ;; flycheck
  (flycheck-info (:underline (:style 'line :color code-light-blue)))
  (flycheck-warning (:underline (:style 'line :color code-light-yellow)))
  (flycheck-error (:underline (:style 'line :color code-light-red)))
  (flycheck-fringe-info (:inherit 'success))
  (flycheck-fringe-warning (:inherit 'warning))
  (flycheck-fringe-error (:inherit 'error))

  ;; ivy
  (ivy-minibuffer-match-face-1 nil)
  (ivy-minibuffer-match-face-2 (:foreground code-gray))
  (ivy-minibuffer-match-face-3 (:inherit 'ivy-minibuffer-match-face-2))
  (ivy-minibuffer-match-face-4 (:inherit 'ivy-minibuffer-match-face-2))
  (ivy-cursor (:foreground code-fg :background code-bg))
  (ivy-current-match (:background code-dark))
  (ivy-prompt-match (:inherit 'ivy-current-match))
  (ivy-highlight-face (:foreground code-light-cyan))
  (ivy-action (:foreground code-light-blue))
  (ivy-virtual (:foreground code-light-green))
  (ivy-remote (:foreground code-light-magenta))
  (ivy-modified-buffer (:foreground code-light-yellow))
  (ivy-subdir (:foreground code-light-blue :bold t))
  (ivy-match-required-face (:inherit 'minibuffer-prompt :foreground code-red))
  (ivy-confirm-face (:inherit 'minibuffer-prompt :foreground code-light-blue))

  ;; avy
  (avy-lead-face-0 (:foreground code-light-blue :background code-darker))
  (avy-lead-face-1 (:foreground code-light-magenta :background code-darker))
  (avy-lead-face-2 (:foreground code-light-green :background code-darker))
  (avy-lead-face (:foreground code-light-red :background code-darker))

  ;; which function
  (which-func nil)

  ;; org mode
  (org-done (:foreground code-light-green))
  (org-todo (:foreground code-light-red))
  (org-date (:foreground code-magenta))
  (org-table (:foreground code-blue))

  ;; latex
  (font-latex-bold-face (:bold t))
  (font-latex-italic-face (:slant 'italic))
  (font-latex-script-char-face (:foreground code-gray))
  (font-latex-verbatim-face (:inherit 'fixed-pitch :background code-darker))
  (font-latex-warning-face (:foreground code-red :bold t))
  (font-latex-string-face (:foreground code-light-yellow))
  (font-latex-sedate-face (:foreground code-gray))
  (font-latex-math-face (:foreground code-light-green))
  (font-latex-sectioning-5-face (:foreground code-light-yellow :bold t))

  ;; web mode
  (web-mode-doctype-face (:foreground code-gray))
  (web-mode-html-tag-bracket-face (:foreground code-gray))
  (web-mode-html-attr-equal-face (:foreground code-gray))
  (web-mode-html-attr-name-face (:foreground code-light-green))
  (web-mode-html-tag-face (:foreground code-light-blue))

  ;; js2 mode
  (js2-external-variable (:inherit 'warning))
  (js2-jsdoc-html-tag-delimiter (:inherit 'web-mode-html-tag-bracket-face))
  (js2-jsdoc-html-tag-name (:inherit 'web-mode-html-tag-face))
  (js2-function-param (:inherit 'font-lock-variable-name-face))
  (js2-jsdoc-value (:inherit 'font-lock-string-face))
  (js2-jsdoc-type (:inherit 'font-lock-type-face))
  (js2-jsdoc-tag (:inherit 'font-lock-comment-face :italic t))
  (js2-error (:inherit 'error))
  (js2-warning (:inherit 'warning))

  ;; idris mode
  (idris-operator-face (:inherit 'font-lock-comment-face))
  (idris-semantic-bound-face (:inherit 'font-lock-variable-name-face))
  (idris-semantic-data-face (:foreground code-cyan))
  (idris-semantic-function-face (:foreground code-light-magenta))
  (idris-semantic-type-face (:inherit 'font-lock-type-face))
  (idris-semantic-postulate-face (:inherit 'font-lock-preprocessor-face))

  ;; markdown
  (markdown-code-face (:inherit 'fixed-pitch :background code-darker))
  )

 (custom-theme-set-variables
  'code
  `(ansi-color-names-vector
    [
     ,code-darker
     ,code-red
     ,code-green
     ,code-yellow
     ,code-blue
     ,code-magenta
     ,code-cyan
     ,code-gray
     ])))

(require 'autothemer)

(autothemer-deftheme
 code "Code"

 ((((class color) (min-colors #xFFFFFF))
   ((class color) (min-colors #xF)))

  (code-darker "#383c3c" "black")
  (code-red "#e85a45" "red")
  (code-green "#6bc021" "green")
  (code-yellow "#cacd28" "yellow")
  (code-blue "#5a89e6" "blue")
  (code-magenta "#af68ed" "magenta")
  (code-cyan "#29c87e" "cyan")
  (code-gray "#7c848a" "white")
  (code-dark "#555b5c" "brightblack")
  (code-light-red "#f68090" "brightred")
  (code-light-green "#83e17f" "brightgreen")
  (code-light-yellow "#edc77f" "brightyellow")
  (code-light-blue "#74c7f6" "brightblue")
  (code-light-magenta "#f3a1f4" "brightmagenta")
  (code-light-cyan "#36e9c0" "brightcyan")
  (code-white "#f0f3f4" "brightwhite")
  (code-fg "#d3d7d8" "unspecified-fg")
  (code-bg "#232425" "unspecified-bg"))

 (
  ;; text
  (default (:foreground code-fg :background code-bg))
  (bold (:weight 'bold))
  (italic (:slant 'italic))
  (bold-italic (:weight 'bold :slant 'italic))
  (underline (:underline t))
  (shadow (:foreground code-gray))
  (link (:foreground code-light-blue :underline t))
  (link-visited (:foreground code-light-magenta :underline t))
  (highlight (:foreground code-light-cyan :background code-darker))

  (cursor (:background code-fg))
  (success (:foreground code-green))
  (warning (:foreground code-yellow))
  (error (:foreground code-red))
  (linum (:foreground code-dark :background code-bg))
  (minibuffer-prompt (:foreground code-light-blue))
  (match (:background code-dark))
  (escape-glyph (:foreground code-light-blue))

  ;; window
  (fringe nil)
  (window-divider (:foreground code-dark))
  (vertical-border (:foreground code-dark))
  (region (:background code-dark))
  (secondary-selection (:background code-darker))
  (hl-line (:background code-darker))
  (tooltip (:background code-darker))

  ;; mode line
  (mode-line (:foreground code-light-blue :background code-darker))
  (mode-line-inactive (:foreground code-gray :background code-darker))
  (mode-line-highlight (:foreground code-light-red))
  (mode-line-emphasis (:foreground code-light-red))
  (mode-line-buffer-id (:bold t))

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

  ;; show paren
  (show-paren-match (:foreground code-light-blue :background code-dark :bold t))
  (show-paren-match-expression (:inherit 'show-paren-match))
  (show-paren-mismatch (:foreground code-light-red :background code-dark :bold t))

  ;; isearch
  (isearch (:background code-dark))
  (isearch-fail (:foreground code-light-red :bold t))
  (lazy-highlight (:background code-dark))

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

  ;; evil
  (evil-ex-info (:foreground code-light-blue :slant 'italic))
  (evil-ex-commands (:slant 'italic :underline t))
  (evil-ex-search (:inherit 'isearch))
  (evil-ex-lazy-highlight (:inherit 'lazy-highlight))
  (evil-ex-substitute-matches (:foreground code-light-red :background code-darker :bold t :strike-through t))
  (evil-ex-substitute-replacement (:foreground code-light-blue :background code-darker :bold t))

  ;; nlinum
  (nlinum (:foreground code-dark :background code-bg))
  (nlinum-current-line (:foreground code-gray))

  ;; highlight indentation
  (highlight-indentation-current-column-face (:background code-dark))
  (highlight-indentation-face (:background code-darker))

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
  (ivy-prompt-match (:inherit 'ivy-current-match))
  (ivy-highlight-face (:inherit 'highlight))
  (ivy-action (:foreground code-light-blue))
  (ivy-virtual (:foreground code-light-yellow))
  (ivy-remote (:foreground code-light-magenta))
  (ivy-modified-buffer (:foreground code-light-green))
  (ivy-subdir (:foreground code-light-blue :bold t))
  (ivy-match-required-face (:inherit 'minibuffer-prompt :foreground code-red))
  (ivy-confirm-face (:inherit 'minibuffer-prompt :foreground code-green))
  (ivy-minibuffer-match-face-4 (:foreground code-light-yellow :bold t))
  (ivy-minibuffer-match-face-3 (:foreground code-light-green :bold t))
  (ivy-minibuffer-match-face-2 (:foreground code-light-blue :bold t))
  (ivy-minibuffer-match-face-1 (:foreground code-light-magenta))
  (ivy-current-match (:background code-darker))
  (ivy-cursor (:foreground code-fg :background code-bg))

  ;; avy
  (avy-lead-face-0 (:foreground code-light-blue :background code-darker))
  (avy-lead-face-1 (:foreground code-light-magenta :background code-darker))
  (avy-lead-face-2 (:foreground code-light-green :background code-darker))
  (avy-lead-face (:foreground code-light-red :background code-darker))

  ;; eldoc
  (eldoc-highlight-function-argument (:foreground code-light-blue :bold t))

  ;; latex
  (font-latex-bold-face (:bold t))
  (font-latex-italic-face (:slant 'italic))
  (font-latex-script-char-face (:foreground code-gray))
  (font-latex-verbatim-face (:inherit 'fixed-pitch :background code-darker))
  (font-latex-warning-face (:foreground code-red :bold t))
  (font-latex-string-face (:foreground code-light-yellow))
  (font-latex-sedate-face (:foreground code-gray))
  (font-latex-math-face (:foreground code-light-green))

  ;; web mode
  (web-mode-doctype-face (:foreground code-gray))
  (web-mode-html-tag-bracket-face (:foreground code-gray))
  (web-mode-html-attr-equal-face (:foreground code-gray))
  (web-mode-html-attr-name-face (:foreground code-light-green))
  (web-mode-html-tag-face (:foreground code-light-blue))

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
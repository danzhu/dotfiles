;;; code-theme.el
;;; -*- no-byte-compile: t; -*-

(require 'autothemer)

(autothemer-deftheme
 code "Code"

 ((((class color) (min-colors #xFFFFFF))
   ((class color) (min-colors #xF)))

  (fg              "#{{foreground   }}" "unspecified-fg")
  (bg              "#{{background   }}" "unspecified-bg")
  (black           "#{{black        }}" "black"         )
  (red             "#{{red          }}" "red"           )
  (green           "#{{green        }}" "green"         )
  (yellow          "#{{yellow       }}" "yellow"        )
  (blue            "#{{blue         }}" "blue"          )
  (magenta         "#{{magenta      }}" "magenta"       )
  (cyan            "#{{cyan         }}" "cyan"          )
  (white           "#{{white        }}" "white"         )
  (light-black     "#{{light_black  }}" "brightblack"   )
  (light-red       "#{{light_red    }}" "brightred"     )
  (light-green     "#{{light_green  }}" "brightgreen"   )
  (light-yellow    "#{{light_yellow }}" "brightyellow"  )
  (light-blue      "#{{light_blue   }}" "brightblue"    )
  (light-magenta   "#{{light_magenta}}" "brightmagenta" )
  (light-cyan      "#{{light_cyan   }}" "brightcyan"    )
  (light-white     "#{{light_white  }}" "brightwhite"   )
  )

 (
  ;; text
  (default (:foreground fg :background bg :family "{{font_mono}}" :height {{font_size}}0))
  (bold (:bold t))
  (italic (:italic t))
  (bold-italic (:bold t :italic t))
  (underline (:underline t))
  (fixed-pitch-serif ())
  (shadow (:foreground white))
  (highlight (:foreground light-white :background light-black :bold t))
  (link (:foreground light-blue :underline t))
  (link-visited (:foreground light-magenta :underline t))
  (escape-glyph (:foreground light-blue))

  (cursor (:background fg))
  (success (:foreground green))
  (warning (:foreground yellow))
  (error (:foreground red))
  (match (:background light-black))

  ;; window
  (fringe nil)
  (window-divider (:foreground light-black))
  (vertical-border (:foreground light-black))
  (region (:background light-black))
  (secondary-selection (:background black))
  (hl-line (:background black))
  (tooltip (:foreground fg :background black))
  (minibuffer-prompt (:foreground light-blue))

  ;; menu
  (menu (:background black))
  (tty-menu-enabled-face (:background black))
  (tty-menu-disabled-face (:foreground white :background black))
  (tty-menu-selected-face (:background bg))

  ;; mode line
  (mode-line (:foreground light-blue :background black))
  (mode-line-inactive (:foreground white :background black))
  (mode-line-buffer-id (:foreground light-white :bold t))
  (mode-line-buffer-id-inactive (:foreground fg))
  (mode-line-highlight (:background light-black))
  (mode-line-emphasis (:foreground light-green))

  ;; header line
  (header-line (:inherit 'mode-line))
  (header-line-highlight (:inherit 'highlight))

  ;; font lock
  (font-lock-comment-face (:foreground white))
  (font-lock-comment-delimiter-face (:foreground light-black))
  (font-lock-string-face (:foreground yellow))
  (font-lock-doc-face (:inherit font-lock-string-face :italic t))
  (font-lock-doc-markup-face (:inherit 'font-lock-comment-face))
  (font-lock-keyword-face (:foreground light-blue))
  (font-lock-builtin-face (:foreground magenta))
  (font-lock-function-name-face (:foreground light-magenta))
  ;; (font-lock-function-call-face ())
  (font-lock-variable-name-face (:foreground light-red))
  ;; (font-lock-variable-use-face ())
  (font-lock-type-face (:foreground cyan))
  (font-lock-constant-face (:foreground green))
  ;; (font-lock-warning-face (:foreground red))
  ;; (font-lock-negation-char-face (:foreground light-white :bold t))
  (font-lock-preprocessor-face (:foreground blue))
  ;; (font-lock-regexp-grouping-backslash ())
  ;; (font-lock-regexp-grouping-construct ())
  ;; (font-lock-escape-face ())
  (font-lock-number-face (:inherit 'font-lock-constant-face))
  (font-lock-operator-face (:inherit 'font-lock-keyword-face))
  (font-lock-property-name-face (:foreground light-yellow))
  ;; (font-lock-property-use-face ())
  (font-lock-punctuation-face (:foreground fg))
  ;; (font-lock-bracket-face ())
  ;; (font-lock-delimiter-face ())
  ;; (font-lock-misc-punctuation-face ())

  ;; tree-sitter
  (tree-sitter-hl-face:function.call (:inherit 'font-lock-function-call-face))
  (tree-sitter-hl-face:function.builtin (:inherit 'tree-sitter-hl-face:function.call))

  (tree-sitter-hl-face:type.argument (:foreground light-green))
  (tree-sitter-hl-face:type.builtin (:inherit 'tree-sitter-hl-face:type))
  ;; (tree-sitter-hl-face:constructor (:inherit 'tree-sitter-hl-face:type :bold t))

  (tree-sitter-hl-face:property (:inherit 'font-lock-property-use-face))
  (tree-sitter-hl-face:property.definition (:inherit 'font-lock-property-name-face))

  (tree-sitter-hl-face:operator (:inherit 'font-lock-operator-face))
  (tree-sitter-hl-face:constant.builtin (:inherit 'tree-sitter-hl-face:constant))
  (tree-sitter-hl-face:number (:inherit 'font-lock-number-face))

  (tree-sitter-hl-face:punctuation (:inherit 'font-lock-punctuation-face))
  (tree-sitter-hl-face:punctuation.bracket (:inherit 'font-lock-bracket-face))
  (tree-sitter-hl-face:punctuation.delimiter (:inherit 'font-lock-delimiter-face))

  ;; customize
  (custom-variable-tag (:foreground light-cyan :bold t))
  (custom-group-tag (:inherit 'variable-pitch :foreground light-cyan :height 1.2 :bold t))
  (custom-group-tag-1 (:inherit 'variable-pitch :foreground light-red :height 1.2 :bold t))
  (custom-comment-tag (:foreground light-yellow))
  (custom-comment (:background black))
  (custom-state (:foreground green))
  (widget-field (:background black))

  ;; tab bar
  (tab-bar (:foreground black :background black))
  (tab-bar-tab (:foreground fg :background bg))
  (tab-bar-tab-inactive (:foreground white :background black))

  ;; tab line
  (tab-line (:foreground black :background black))
  (centaur-tabs-default (:foreground black :background black))
  (centaur-tabs-selected (:foreground fg :background bg))
  (centaur-tabs-unselected (:foreground white :background black))
  (centaur-tabs-selected-modified (:foreground light-red :background bg))
  (centaur-tabs-unselected-modified (:foreground light-red :background black))
  (centaur-tabs-active-bar-face (:background light-blue))

  ;; line number
  (linum (:foreground white :background bg :bold nil :italic nil :underline nil :strike-through nil))
  (line-number (:foreground white :background bg :bold nil :italic nil :underline nil :strike-through nil))
  (line-number-current-line (:foreground fg :background black :bold nil :italic nil :underline nil :strike-through nil))

  ;; fill column
  (fill-column-indicator (:foreground black))

  ;; show paren
  (show-paren-match (:foreground light-blue :background light-black :bold t))
  (show-paren-match-expression (:inherit 'show-paren-match))
  (show-paren-mismatch (:foreground light-red :background light-black :bold t))

  ;; whitespace
  (whitespace-empty (:background light-black))
  (whitespace-indentation (:background light-black))
  (whitespace-trailing (:background light-black))

  ;; isearch
  (isearch (:background light-black))
  (isearch-fail (:foreground light-red :bold t))
  (lazy-highlight (:background light-black))

  ;; eldoc
  (eldoc-highlight-function-argument (:foreground light-blue :bold t))

  ;; flyspell
  (flyspell-duplicate (:underline (:style 'wave :color yellow)))
  (flyspell-incorrect (:underline (:style 'wave :color red)))

  ;; ansi term
  (ansi-color-black (:foreground black :background black))
  (ansi-color-red (:foreground red :background red))
  (ansi-color-green (:foreground green :background green))
  (ansi-color-yellow (:foreground yellow :background yellow))
  (ansi-color-blue (:foreground blue :background blue))
  (ansi-color-magenta (:foreground magenta :background magenta))
  (ansi-color-cyan (:foreground cyan :background cyan))
  (ansi-color-white (:foreground white :background white))
  (ansi-color-bright-black (:foreground light-black :background light-black))
  (ansi-color-bright-red (:foreground light-red :background light-red))
  (ansi-color-bright-green (:foreground light-green :background light-green))
  (ansi-color-bright-yellow (:foreground light-yellow :background light-yellow))
  (ansi-color-bright-blue (:foreground light-blue :background light-blue))
  (ansi-color-bright-magenta (:foreground light-magenta :background light-magenta))
  (ansi-color-bright-cyan (:foreground light-cyan :background light-cyan))
  (ansi-color-bright-white (:foreground light-white :background light-white))

  ;; compilation
  (compilation-info (:foreground blue))
  (compilation-mode-line-fail (:inherit 'error))

  ;; sh mode
  (sh-heredoc (:inherit 'font-lock-string-face))
  (sh-quoted-exec (:inherit 'font-lock-function-name-face))

  ;; evil
  (evil-ex-info (:foreground light-blue :italic t))
  (evil-ex-commands (:italic t :underline t))
  (evil-ex-search (:inherit 'isearch))
  (evil-ex-lazy-highlight (:inherit 'lazy-highlight))
  (evil-ex-substitute-matches (:foreground light-red :background black :bold t :strike-through t))
  (evil-ex-substitute-replacement (:foreground light-blue :background black :bold t))

  ;; undo tree
  (undo-tree-visualizer-active-branch-face (:bold t))
  (undo-tree-visualizer-current-face (:foreground light-red))
  (undo-tree-visualizer-register-face (:foreground light-yellow))
  (undo-tree-visualizer-unmodified-face (:foreground light-cyan))

  ;; nlinum
  (nlinum-current-line (:foreground fg :background black :bold nil :italic nil :underline nil :strike-through nil))

  ;; doom modeline
  (doom-modeline-bar (:background light-blue))
  (doom-modeline-bar-inactive (:background white))

  ;; powerline
  (powerline-active1 (:foreground fg :background light-black))
  (powerline-inactive1 (:foreground fg :background light-black))
  (powerline-active2 (:foreground white :background bg))
  (powerline-inactive2 (:foreground white :background bg))

  ;; git gutter
  (diff-hl-insert (:foreground green))
  (diff-hl-change (:foreground yellow))
  (diff-hl-delete (:foreground red))

  ;; highlight indent guides
  (highlight-indent-guides-odd-face (:background black))
  (highlight-indent-guides-even-face (:background black))
  (highlight-indent-guides-character-face (:foreground black))
  (highlight-indent-guides-top-odd-face (:background light-black))
  (highlight-indent-guides-top-even-face (:background light-black))
  (highlight-indent-guides-top-character-face (:foreground light-black))

  ;; popup
  (popup-face (:inherit 'tooltip))
  (popup-tip-face (:inherit 'popup-face :foreground light-blue))

  ;; lsp-mode
  (lsp-face-highlight-read (:background light-black))
  (lsp-face-highlight-textual (:background light-black))
  (lsp-face-highlight-write (:background light-black))

  ;; lsp-ui
  (lsp-ui-doc-background (:background bg))
  (lsp-ui-sideline-action (:foreground yellow))

  ;; company
  (company-template-field (:background light-black))
  (company-echo nil)
  (company-echo-common (:foreground light-blue))
  (company-preview (:foreground fg :background bg))
  (company-preview-common (:foreground light-blue))
  (company-preview-search (:foreground blue :background black))
  (company-scrollbar-bg (:background light-black))
  (company-scrollbar-fg (:background white))
  (company-tooltip (:background black))
  (company-tooltip-selection (:background bg))
  (company-tooltip-common (:foreground white))
  (company-tooltip-search (:foreground light-red))
  (company-tooltip-annotation (:foreground light-blue))
  (company-tooltip-mouse (:inherit 'company-tooltip-selection))
  (company-tooltip-common-selection (:inherit 'company-tooltip-common))
  (company-tooltip-search-selection (:inherit 'company-tooltip-search))
  (company-tooltip-annotation-selection (:inherit 'company-tooltip-annotation))

  ;; corfu
  (corfu-bar (:background white))
  (corfu-current (:background bg))
  (corfu-default (:background black))

  ;; flycheck
  (flycheck-info (:underline (:style 'line :color light-blue)))
  (flycheck-warning (:underline (:style 'line :color light-yellow)))
  (flycheck-error (:underline (:style 'line :color light-red)))
  (flycheck-fringe-info (:inherit 'success))
  (flycheck-fringe-warning (:inherit 'warning))
  (flycheck-fringe-error (:inherit 'error))

  ;; ivy
  (ivy-minibuffer-match-face-1 nil)
  (ivy-minibuffer-match-face-2 (:foreground white))
  (ivy-minibuffer-match-face-3 (:inherit 'ivy-minibuffer-match-face-2))
  (ivy-minibuffer-match-face-4 (:inherit 'ivy-minibuffer-match-face-2))
  (ivy-cursor (:foreground fg :background bg))
  (ivy-current-match (:background light-black))
  (ivy-prompt-match (:inherit 'ivy-current-match))
  (ivy-highlight-face (:foreground light-cyan))
  (ivy-action (:foreground light-blue))
  (ivy-virtual (:foreground light-green))
  (ivy-remote (:foreground light-magenta))
  (ivy-modified-buffer (:foreground light-yellow))
  (ivy-subdir (:foreground light-blue :bold t))
  (ivy-match-required-face (:inherit 'minibuffer-prompt :foreground red))
  (ivy-confirm-face (:inherit 'minibuffer-prompt :foreground light-blue))

  ;; avy
  (avy-lead-face-0 (:foreground light-blue :background black))
  (avy-lead-face-1 (:foreground light-magenta :background black))
  (avy-lead-face-2 (:foreground light-green :background black))
  (avy-lead-face (:foreground light-red :background black))

  ;; which function
  (which-func nil)

  ;; org mode
  (org-done (:foreground light-green))
  (org-todo (:foreground light-red))
  (org-date (:foreground magenta))
  (org-table (:foreground blue))

  ;; latex
  (font-latex-bold-face (:bold t))
  (font-latex-italic-face (:italic t))
  (font-latex-script-char-face (:foreground white))
  (font-latex-verbatim-face (:inherit 'fixed-pitch :background black))
  (font-latex-warning-face (:foreground red :bold t))
  (font-latex-string-face (:foreground light-yellow))
  (font-latex-sedate-face (:foreground white))
  (font-latex-math-face (:foreground light-green))
  (font-latex-sectioning-5-face (:foreground light-yellow :bold t))

  ;; web mode
  (web-mode-doctype-face (:foreground white))
  (web-mode-html-tag-bracket-face (:foreground white))
  (web-mode-html-attr-equal-face (:foreground white))
  (web-mode-html-attr-name-face (:foreground light-green))
  (web-mode-html-tag-face (:foreground light-blue))

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

  ;; haskell mode
  (haskell-operator-face (:inherit 'font-lock-keyword-face))

  ;; idris mode
  (idris-operator-face (:inherit 'font-lock-keyword-face))
  (idris-semantic-bound-face (:inherit 'font-lock-variable-name-face))
  (idris-semantic-data-face (:foreground cyan))
  (idris-semantic-function-face (:foreground light-magenta))
  (idris-semantic-type-face (:inherit 'font-lock-type-face))
  (idris-semantic-postulate-face (:inherit 'font-lock-preprocessor-face))

  ;; markdown
  (markdown-face (:inherit 'fixed-pitch :background black))
  ))

;;; code-theme.el ends here

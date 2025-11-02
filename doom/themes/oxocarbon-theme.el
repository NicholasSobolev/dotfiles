;;; oxocarbon-theme --- Port of Nvim's oxocarbon.nvim

(require 'autothemer)

;;; Code:

(autothemer-deftheme oxocarbon "EMACS port of oxocarbon.nvim"
 ((((class color) (min-colors #xFFFFFF)))

  (base00 "#111")
  (base01 "#262626")
  (base02 "#393939")
  (base03 "#525252")
  (base04 "#d0d0d0")
  (base05 "#f2f2f2")
  (base06 "#ffffff")
  (base07-turquoise "#08bdba")
  (base08-cyan "#3ddbd9")
  (base09-blue "#78a9ff")
  (base10-red "#ee5396")
  (base11-light-blue "#33b1ff")
  (base12-pink "#ff7eb6")
  (base13-green "#42be65")
  (base14-purple "#be95ff")
  (base15-lighter-blue "#82cfff")
  (blend "#131313"))

 (;; Common Faces
  (error
   (:foreground base10-red :inherit ('bold 'underline)))
  (warning
   (:foreground base04 :inherit ('bold 'underline)))
  (success
   (:foreground base13-green :inherit ('bold 'underline)))
  (default
   (:foreground base04 :background base00))
  (fringe
   (:inherit 'default))
  (link
   (:foreground base14-purple))
  (highlight
   (:foreground nil :background base01))
  (escape-glyph
   (:foreground base15-lighter-blue))
  (homoglyph
   (:foreground base01 :background base07-turquoise))
  (nobreak-space
   (:inherit 'homoglyph))
  (nobreak-hyphen
   (:inherit 'homoglyph))

  (flycheck-info
   (:foreground nil :inherit ('underline)))

  ;; Editor
  (line-number
   (:foreground base03 :background base00 :inherit 'default))
  (line-number-current-line
   (:foreground base04 :inherit ('highlight 'line-number 'default)))
  (fill-column-indicator
   (:background base00))

  (vertical-border ; Technically, the border should be changed to a vertical line, but this is easier
   (:foreground base01 :background base01))

  (region
   (:background base02))

  (mode-line
   (:background base00 :inherit 'default))
  (mode-line-inactive
   (:inherit 'mode-line))
  (mode-line-active
   (:inherit 'mode-line))
  (mode-line-highlight
   (:background base01 :inherit 'mode-line))

  (show-paren-match
   (:foreground nil :background base03 :inherit 'underline))

  ;; Syntax
  (font-lock-punctuation-face
   (:inherit 'default))
  (font-lock-misc-punctuation-face
   (:inherit 'font-lock-punctuation-face))
  (font-lock-delimiter-face
   (:inherit 'font-lock-punctuation-face))
  (font-lock-bracket-face
   (:foreground base03))
  (font-lock-operator-face
   (:foreground base09-blue))

  (font-lock-negation-char-face ; TODO: should this just inherit operator?
   (:foreground base10-red))

  (font-lock-property-name-face
   (:foreground base10-red))
  (font-lock-property-use-face
   (:inherit 'font-lock-property-name-face))

  (font-lock-number-face
   (:foreground base11-light-blue))
  (highlight-numbers-number
   (:inherit 'font-lock-number-face))

  (font-lock-regexp-grouping-backslash
   (:inherit 'escape-glyph))

  (font-lock-comment-face
   (:foreground base03))
  (font-lock-doc-face
   (:foreground base14-purple :inherit 'font-lock-comment-face))

  (font-lock-string-face
   (:foreground base14-purple))

  (font-lock-keyword-face
   (:foreground base09-blue))
  (font-lock-function-name-face
   (:foreground base12-pink :inherit 'bold))
  (font-lock-builtin-face ; TODO: Is this the right choice?
   (:foreground base14-purple))
  (font-lock-function-call-face
   (:inherit 'font-lock-function-name-face))

  (font-lock-variable-name-face
   (:inherit 'default))
  (font-lock-variable-use-face
   (:inherit 'font-lock-variable-name-face))
  (font-lock-constant-face
   (:foreground base12-pink))

  (font-lock-type-face
   (:foreground base09-blue))

  (font-lock-preprocessor-face
   (:foreground base07-turquoise :inherit 'bold))

  ;; Org Mode
  (org-level-1
   (:foreground base10-red))
  (org-level-2
   (:inherit 'default))
  (org-level-3
   (:foreground base09-blue))
  (org-level-4
   (:foreground base07-turquoise))
  (org-level-5
   (:foreground base08-cyan))
  (org-level-6
   (:foreground base11-light-blue))
  (org-level-7
   (:foreground base13-green))
  (org-level-8
   (:foreground base15-lighter-blue))

  ;; Git/Diff
  (diff-hl-change
   (:foreground base08-cyan))
  (diff-error
   (:foreground base10-red :inherit 'underline)))

 (setq frame-background-mode 'dark)
 (add-to-list 'default-frame-alist '(background-color . base00))
 (add-to-list 'default-frame-alist '(alpha-background . 100))
 (add-to-list 'default-frame-alist '(alpha 100 100)))

(provide 'oxocarbon-theme)

;;; oxocarbon-theme.el ends here

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;   	user-mail-address "john@doe.com")

(setq user-full-name "NicholasSobolev"
      user-mail-address "nicholassobolev26@gmail.com")

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
;;  	doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; Set Nerd Font Mono as the default font
(add-to-list 'custom-theme-load-path "~/.config/doom/themes")
(load-theme 'oxocarbon t)
(after! doom-dashboard
  (custom-set-faces!
    '(doom-dashboard-banner :foreground "#f2f4f8" :background nil :weight bold :inherit variable-pitch)
    '(doom-dashboard-menu-title :foreground "#ffffff" :weight bold)
    '(doom-dashboard-menu-desc :foreground "#dde1e6")
    '(doom-dashboard-loaded :foreground "#78a9ff")
    '(doom-dashboard-footer :foreground "#525252" :inherit font-lock-comment-face)))
(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 14)) ;; Change the size as needed
(setq doom-unicode-font (font-spec :family "FiraCode Nerd Font Mono" :size 14)) ;; Optional for Unicode characters



;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/notes/org/")
(setq org-roam-directory (file-truename "~/notes/org-roam/"))
(setq org-agenda-files
      (directory-files-recursively org-roam-directory "\\.org$"))
(setq org-roam-dailies-directory "~/notes/org-roam/daily/")
(setq org-roam-file-exclude-regexp "daily/.*\\.org$") ; Relative path
(setq org-roam-file-extension "org")
(setq org-roam-node-display-template
      (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
(setq org-roam-capture-templates
      '(("m" "main" plain "%?"
         :if-new (file+head "main/${slug}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)
        ("c" "code" plain "%?"
         :if-new (file+head "code/${title}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)
        ("r" "reference" plain "%?"
         :if-new (file+head "reference/${title}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)
        ("p" "personal" plain "%?"
         :if-new (file+head "personal/${slug}.org" "#+title: ${title}\n")
         :unnarrowed t)
        ("b" "books" plain "%?"
         :if-new (file+head "personal/books/${slug}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)
        ("h" "health" plain "%?"
         :if-new (file+head "personal/health/${slug}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)
        ("d" "default" plain "%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)))
;;(setq org-agenda-files '("~/notes/org-roam/daily-todos.org" "~/notes/org-roam/daily/"))

(use-package! org-roam
  :after org
  :ensure t
  :custom
  (setq org-roam-directory (file-truename "~/notes/org-roam/"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (require 'org-roam-node)
  (org-roam-db-autosync-mode)
  (require 'org-roam-protocol))

(map! :leader
      :prefix "n"
      :desc "Org-roam buffer"        "l" #'org-roam-buffer-toggle
      :desc "Find node"              "f" #'org-roam-node-find
      :desc "Insert node"            "i" #'org-roam-node-insert
      :desc "Capture node"           "c" #'org-roam-capture
      :desc "Org-roam graph"         "g" #'org-roam-graph
      :desc "Dailies capture today"  "j" #'org-roam-dailies-capture-today)

(use-package! org-roam-ui
  :after org-roam
  :hook (org-roam-mode . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(use-package! vterm
  :ensure t
  :commands vterm)

(setq default-input-method "japanese")
(general-define-key
 :states 'insert
 "q" (general-key-dispatch 'self-insert-command
      :timeout 0.25
      "q" 'toggle-input-method))

(set-frame-parameter nil 'alpha-background 80)
(add-to-list 'default-frame-alist '(alpha-background . 80))


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

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "David Holland"
      user-mail-address "info@dustvoice.de")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
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
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font (font-spec :family "Fira Code" :size 12))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
(setq doom-theme 'doom-dracula)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

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

;; This should of course be grammmatically correct

;; Not working with hyperv-forward atm
;;(setq epg-gpg-program "/usr/bin/gpg2")
;;(setq epg-user-id "7A9CA430D426100E")
;;(pinentry-start)
;;(setq epg-agent-file "~/.gnupg/S.gpg-agent")

(remove-hook 'doom-first-input-hook #'evil-snipe-mode)
;;(define-key evil-normal-state-map (kbd "gj") 'evil-next-visual-line)
;;(define-key evil-normal-state-map (kbd "gk") 'evil-previous-visual-line)

;;(add-hook 'org-mode-hook #'org-modern-mode)

;;(after! flycheck (flycheck-grammarly-setup))

(setq-default lsp-rust-analyzer-proc-macro-enable t)

(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("dustdoc" "\\documentclass[10pt]{dustdoc}"
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

;; (use-package! paw64-mode
;;   :init
;;   :config
;; 
;;   (define-derived-mode paw64-mode
;;     prog-mode
;;     "Paw64"
;;     "Major mode for 6502/6510 assembly with 64tass and/or paw64"
;;     (set-syntax-table (make-syntax-table paw64-mode-syntax-table))
;;     (set (make-local-variable 'font-lock-defaults) '(paw64-font-lock-keywords))
;;     (set (make-local-variable 'indent-line-function) 'paw64-indent)
;; 
;;     (add-hook 'post-command-hook #'paw64-post-command-hook nil t)
;;     (electric-indent-local-mode -1)))

(use-package! arm-mode)

(use-package! json-navigator)

(use-package! ron-mode)

(map! :map dap-mode-map
      :leader
      :prefix ("d" . "dap")
      ;; basics
      :desc "dap next"          "n" #'dap-next
      :desc "dap step in"       "i" #'dap-step-in
      :desc "dap step out"      "o" #'dap-step-out
      :desc "dap continue"      "c" #'dap-continue
      :desc "dap hydra"         "h" #'dap-hydra
      :desc "dap debug restart" "r" #'dap-debug-restart
      :desc "dap debug"         "s" #'dap-debug

      ;; debug
      :prefix ("dd" . "Debug")
      :desc "dap debug recent"  "r" #'dap-debug-recent
      :desc "dap debug last"    "l" #'dap-debug-last

      ;; eval
      :prefix ("de" . "Eval")
      :desc "eval"                "e" #'dap-eval
      :desc "eval region"         "r" #'dap-eval-region
      :desc "eval thing at point" "s" #'dap-eval-thing-at-point
      :desc "add expression"      "a" #'dap-ui-expressions-add
      :desc "remove expression"   "d" #'dap-ui-expressions-remove

      :prefix ("db" . "Breakpoint")
      :desc "dap breakpoint toggle"      "b" #'dap-breakpoint-toggle
      :desc "dap breakpoint condition"   "c" #'dap-breakpoint-condition
      :desc "dap breakpoint hit count"   "h" #'dap-breakpoint-hit-condition
      :desc "dap breakpoint log message" "l" #'dap-breakpoint-log-message)

(use-package! typst-mode
    :mode "\\.typ$")

(use-package! nasm-mode)

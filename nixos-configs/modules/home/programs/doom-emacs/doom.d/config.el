;;; config.el -*- lexical-binding: t; -*-

;; ---------------------------------------------------------
;; General
;; ---------------------------------------------------------

(setq display-line-numbers-type 'relative)

;; Fonts
;; Font
;; Fonts
(setq! doom-font
       (font-spec :family "JetBrainsMono Nerd Font" :size 20)
       doom-variable-pitch-font
       (font-spec :family "JetBrainsMono Nerd Font" :size 20))

(after! nerd-icons
  (setq nerd-icons-font-family "Symbols Nerd Font Mono"))
;; ---------------------------------------------------------
;; Evil
;; ---------------------------------------------------------

;; Evil is enabled through init.el with:
;; (evil +everywhere)

;; ---------------------------------------------------------
;; LSP
;; ---------------------------------------------------------

(after! lsp-mode
  (setq lsp-enable-symbol-highlighting t
        lsp-headerline-breadcrumb-enable t
        lsp-idle-delay 0.2))

;; ---------------------------------------------------------
;; Rust
;; ---------------------------------------------------------

(after! rustic
  (setq rustic-lsp-client 'lsp-mode))

(rust + lsp + treesitter)

;; Theme
(setq doom-theme 'catppuccin')

;; ---------------------------------------------------------
;; Keybindings
;; ---------------------------------------------------------

(map!
 :leader
 :desc "Find file" "f f" #'find-file
 :desc "Search project" "/" #'+default/search-project
 :desc "Save file" "w" #'save-buffer)

;; Normal-mode shortcuts
(map!
 :n "C-s" #'save-buffer
 :n "C-p" #'project-find-file)

(use-package! typst-preview
  :after typst-ts-mode
  :config
  (add-hook! 'typst-ts-mode-hook
    #'typst-preview-mode))

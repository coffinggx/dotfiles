;;; init.el -*- lexical-binding: t; -*-

(doom!
  :completion
  company
  vertico

  :ui
  doom
  doom-dashboard
  hl-todo
  modeline
  ophints
  (popup +defaults)
  vc-gutter
  workspaces

  :editor
  (evil +everywhere)
  file-templates
  fold
  multiple-cursors
  snippets

  :emacs
  dired
  electric
  undo
  vc

  :checkers
  syntax
  spell

  :tools
  (lsp +peek)
  magit

  :lang
  (cc +lsp)

  (python +lsp)
  (typst +lsp)

  (rust +lsp+treesitter)
  sh


  :config
  (default +bindings +smartparens))

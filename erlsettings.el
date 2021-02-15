(use-package company-mode
  :hook (erlang-mode))

(use-package lsp
  :hook (erlang-mode))

(use-package yas-minor-mode
  :hook (erlang-mode))

(use-package flycheck
;;  :diminish flycheck-mode
  :config
  (add-hook 'after-init-hook 'global-flycheck-mode)
;;  (setq flycheck-display-errors-function nil)
  (setq flycheck-erlang-include-path '("../include"))
  (setq flycheck-erlang-library-path '())
  (setq flycheck-check-syntax-automatically '()))

;; erlang settings
;; root dir, used for man pages
(defun my-erlang-mode-setup ()
  (setq indent-tabs-mode nil)
  (setq exec-path (cons "/usr/local/bin" exec-path))
  (setq erlang-electric-commands '(erlang-electric-semicolon))
  (setq exec-path (cons "/Users/aja/github/erlang_ls/_build/default/bin" exec-path))
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  )

(add-hook 'erlang-mode-hook 'my-erlang-mode-setup #'lsp)


;; LSP
;;------
(setq lsp-keymap-prefix "C-l")

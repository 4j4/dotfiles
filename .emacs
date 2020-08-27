;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives
     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("gnu" . "https://elpa.gnu.org/packages/") t)
(package-initialize)

;; required packages
;;(require 'erlang-start)
;;(require 'flycheck)
;;(require 'flycheck-haskell)
;;(require 'neotree)
;;(require 'company)
;;(require 'company-ghc)
;;(require 'company-erlang)
;;(require 'haskell-mode)
;;(require 'omnisharp)
;;(require 'engine-mode)
;;(require 'magit)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("9abe2b502db3ed511fea7ab84b62096ba15a3a71cdb106fd989afa179ff8ab8d" "ffedf8efaf706855579354a34a2da94a9f1d67c64f9b4269649a6a600a0e4a9b" default)))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(ido-mode (quote buffer) nil (ido))
 '(large-file-warning-threshold nil)
 '(org-agenda-files (quote ("~/org/dinner_list.org" "~/org/gtd.org")))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-w3m)))
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (monokai-theme lsp-ui lsp-mode use-package flycheck flycheck-haskell neotree dired-sidebar engine-mode magit company-ghc company-erlang company haskell-mode erlang markdown-mode omnisharp)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))

;; settings to get GUI Emacs running on MacOS
(setq default-input-method "MaxOSX")
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)

;; set search path for custom emacs lisp (.el) files
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; backup settings
;; store all backups at one location -filename- files
(setq backup-directory-alist '(("." . "~/.saves")))
(setq backup-by-copying t)

;; auto save settings
;; store auto-save at one location #filename# files
(setq auto-save-file-name-transforms `((".*" "~/.saves/" t)))

;; keep three new version and two old version
;; with version control
(setq delete-old-versions t
      kept-new-version 3
      kept-old-version 2
      version-control t)

;; show no welcome screen
(setq inhibit-splash-screen t)


;; tabs offset 4
(setq c-basic-offset 4)

;; Default font size
(set-face-attribute 'default nil
		    :family "Hasklig"
		    :height 160
		    :weight 'normal
		    :width 'normal)

(use-package hasklig-mode
  :hook (haskell-mode)
  :hook (erlang-mode))

(use-package company-mode
  :hook (erlang-mode)
  :hook (haskell-mode)
  :hook (emacs-lisp-mode))

;; Cursor blink behavior
;; n = 0 -> never stop blinking
;; nil   -> never blink
;; n > 0 -> stop blinking after n blinks w/o input
(setq blink-cursor-mode 20)

;; show line numbers in all buffers
(global-display-line-numbers-mode)

;; do not line wrap. Full line width
(set-default 'truncate-lines t)

(defun aja-split-window-func ()
  (interactive)
  (split-window-vertically)
  (set-window-buffer (next-window) (other-buffer)))

(global-set-key "\C-x2" 'aja-split-window-func)

;; magit - git settings
(global-set-key (kbd "C-x g") 'magit-status)

;; org mode settings
;; ------------------
;; short cuts
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; persist the clock over histories
(setq org-clock-persist t)
(org-clock-persistence-insinuate)

;; Request note after clocking out in ORG mode
(setq org-log-note-clock-out t)

;; start indented. May slowdown the startup on large org files
(setq org-startup-indented t)

;; org-capture default notes file
(setq org-default-notes-file (concat org-directory "/notes.org"))

;; org-capture templates
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks") "* TODO %?\n  %i\n %a")
	("j" "Add journal entry" entry (file+olp+datetree "~/org/journal.org") "")
	("a" "Appointment" entry (file+headline "~/org/gtd.org" "Appointments") "* %?")
	))

;; gpg setting to ask for passphrase
(setq epa-pinentry-mode 'loopback)

;; include diary into agenda
(setq org-agenda-include-diary t)

;; Company mode settings
;; ---------------------
;; Keyboard hooks
(global-set-key (kbd "C-x c") 'company-complete)

(eval-after-load
    'company
    '(add-to-list 'company-backends 'company-omnisharp 'company-lsp 'company-erlang))

;; erlang settings
;; root dir, used for man pages
(defun my-erlang-mode-setup ()
  (setq indent-tabs-mode nil)
  (setq exec-path (cons "/usr/local/bin" exec-path))
  (setq erlang-electric-commands '(erlang-electric-comma 'erlang-electric-semicolon))
  (setq exec-path (cons "/Users/aja/github/erlang_ls/_build/default/bin" exec-path))
  (setenv "PATH" (concat (getenv "PATH") ":/Users/aja/.erlangInstaller/default/bin"))
  )

(add-hook 'erlang-mode-hook 'my-erlang-mode-setup #'lsp)


;; LSP
;;------
(setq lsp-keymap-prefix "C-l")

;; HASKELL mode settings
;; ---------------------
(defun my-haskell-mode-setup ()
  (interactive-haskell-mode)
  (company-mode)
  (flycheck-haskell-setup)
  (flycheck-mode)

  (setenv "PATH" (concat (getenv "PATH") ":~/.ghcup/bin"))
  (setq exec-path (append exec-path '("~/.ghcup/bin"))))

(add-hook 'haskell-mode-hook 'my-haskell-mode-setup t)

;; NEOTREE file tree browse
;;-------------------------
;;(global-set-key [f8] 'neotree-toggle)

;; engine-mode settings
;; --------------------
;; C-x / followed by the keybinding
(engine-mode t)

(defengine hoogle
  "https://hoogle.haskell.org/?hoogle=%s"
  :keybinding "h")

(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  :keybinding "g")

(defengine stack-overflow
  "https://stackoverflow.com/search?q=%s"
  :keybinding "s")

;; CSharp setup using Omnisharp
;;-----------------------------
(defun my-csharp-mode-setup ()
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)

  (setq indent-tabs-mode nil)
  (setq c-syntactic-indentation t)
  (c-set-style "ellemtel")
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq evil-shift-width 4)

  ;csharp-mode README.md recommends this too
  ;(electric-pair-mode 1)       ;; Emacs 24
  (electric-pair-local-mode 1) ;; Emacs 25

  (local-set-key (kbd "C-c r r") 'omnisharp-run-code-action-refactoring)
  (local-set-key (kbd "C-c C-c") 'recompile))

(add-hook 'csharp-mode-hook 'my-csharp-mode-setup t)

;;coloring dark
(require 'color)
(let ((bg (face-attribute 'default :background)))
    (custom-set-faces
     `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
     `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
     `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
     `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
     `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#41bf505b61e3"))))
 '(company-scrollbar-fg ((t (:background "#377643c95293"))))
 '(company-tooltip ((t (:inherit default :background "#314a3c3e4963"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face)))))

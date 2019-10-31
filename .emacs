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

;; erlang settings
;; root dir, used for man pages
(setq erlang-root-dir "~/.erlangInstaller/22.0")
(add-hook 'erlang-mode-hook 'my-erlang-hook)
(defun my-erlang-hook ()
  (setq indent-tabs-mode nil))

;; tabs offset 4
(setq c-basic-offset 4)

;; Company
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-x c") 'company-complete)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(cua-mode t nil (cua-base))
 '(cursor-type (quote box))
 '(custom-enabled-themes (quote (deeper-blue)))
 '(custom-safe-themes
   (quote
    ("ffedf8efaf706855579354a34a2da94a9f1d67c64f9b4269649a6a600a0e4a9b" default)))
 '(frame-background-mode (quote dark))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(ido-mode (quote buffer) nil (ido))
 '(large-file-warning-threshold nil)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-w3m)))
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (elm-mode company-ghc company-erlang company haskell-mode erlang markdown-mode)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#181a26" :foreground "gray80" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Menlo"))))
 '(company-preview ((t (:background "brightblack" :foreground "wheat"))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-scrollbar-bg ((t nil)))
 '(company-tooltip-annotation ((t (:foreground "brightyellow"))))
 '(company-tooltip-common ((t (:foreground "brightyellow"))))
 '(company-tooltip-selection ((t (:background "brightblue")))))

;; modeline settings
(setq-default mode-line-format
	      (list
	       ;; buffer name
	       "%b "
	       ;; line and column
	       "(%02l,%02c) "
	       "["
	       ;; position in the document
	       "%p"
	       "/"
	       ;; size
	       "%I"
	       "] "
	       "["
	       ;; mode
	       "%m"
	       "] "
	       "["
	       ;; statur row, Overwrite, Modifier, ReadOnly
	       '(:eval (if overwrite-mode "Ovr" "Ins"))
	       '(:eval (when (buffer-modified-p) ",Mod"))
	       '(:eval (when (buffer-read-only) ",Ro"))
	       "] "
	       ;; Time
	       '(:eval (format-time-string "%H:%M"))
	       ;; fill up with dashes
	       " --"
	       "%-"
       ))

(defun aja-split-window-func ()
  (interactive)
  (split-window-vertically)
  (set-window-buffer (next-window) (other-buffer)))

(global-set-key "\C-x2" 'aja-split-window-func)

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
	("j" "Add journal entry" entry (file+olp+datetree "~/org/journal.org") "")))

;; Erlang mode configuration

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq load-path (cons "/Users/aja/.erlangInstaller/default/lib/tools-3.2/emacs" load-path))
(setq erlang-root-dir "/Users/aja/.erlangInstaller/default")
(setq exec-path (cons "/Users/aja/.erlangInstaller/default/bin" exec-path))
(require 'erlang-start)

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

;; enabe hippie-expand to M-Space
(global-set-key "\M- " 'hippie-expand)

;; color settings for mode line
(set-face-foreground 'mode-line "black")
(set-face-background 'mode-line "green")

;; color settings
(set-foreground-color "grean")
(set-background-color "black")

;; persist the clock over histories
(setq org-clock-persist t)
(org-clock-persistence-insinuate)

;; Request note after clocking out in ORG mode
(setq org-log-note-clock-out t)

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
 '(custom-enabled-themes (quote (Aja_MacConsole)))
 '(custom-safe-themes
   (quote
    ("ffedf8efaf706855579354a34a2da94a9f1d67c64f9b4269649a6a600a0e4a9b" default)))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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

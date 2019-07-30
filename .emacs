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

;; keep three old version and two new version
;; with version control
(setq delete-old-versions t
      kept-new-version 3
      kept-old-version 2
      version-control t)

;; enabe hippie-expand to M-Space
(global-set-key "\M- " 'hippie-expand)

(set-face-foreground 'mode-line "black")
(set-face-background 'mode-line "green")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(cursor-type (quote box))
 '(display-battery-mode t)
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

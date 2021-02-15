;; basic init.el.
;; this defines all packages and settings that are applicable to
;; all setups

(require 'package)
(add-to-list 'package-archives
     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("gnu" . "https://elpa.gnu.org/packages/") t)
(package-initialize)

;; set search path for custom emacs lisp (.el) files
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; This is only needed once, near the top of the file
(eval-when-compile
  (require 'use-package))

;; show column lines
(setq column-number-mode t)

;; nice night-owl theme
(load-theme 'monokai-pro t)


;; font style
(set-face-attribute 'default nil
		    :family "Menlo"
		    :height 140
		    :weight 'normal
		    :width 'normal)


;; hide toolbar window
(tool-bar-mode -1)


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


;; Cursor blink behavior
;; n = 0 -> never stop blinking
;; nil   -> never blink
;; n > 0 -> stop blinking after n blinks w/o input
(setq blink-cursor-mode 20)


;; show line numbers in all buffers
(global-display-line-numbers-mode)


;; do not line wrap. Full line width
(set-default 'truncate-lines t)


;; magit git implementation
(global-set-key (kbd "C-x g") 'magit-status)


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

;; disabling annoyance behaviour
;;------------------------------

;; disable sound on reaching top or bottom or end of line
;; instead make the mode line blink
(setq visible-bell nil
      ring-bell-function 'flash-mode-line)
(defun flash-mode-line ()
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil #'invert-face 'mode-line))

;; erlang config
(load-file "~/dotfiles/erlsettings.el")

;; macos settings
(load-file "~/dotfiles/macos.el")

;; gpg setting to ask for passphrase
(require 'epa-file)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (monokai-alt-theme monokai-pro-theme vscode-icon dired-subtree dired-sidebar yasnippet use-package omnisharp night-owl-theme monokai-theme markdown-preview-mode magit lsp-ui engine-mode cyberpunk-theme company-ghc company-erlang))))
(setq epa-pinentry-mode 'loopback)

;; enable parenthesis highlight mode
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)

;; enable ido-mode for buffer, find file, ...
(ido-mode 1)

(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar))
;;  :init
;;  (add-hook 'dired-sidebar-mode-hook
;;            (lambda ()
;;              (unless (file-remote-p default-directory)
;;                (auto-revert-mode))))
;;  :config
  ;; (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  ;; (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  ;; (setq dired-sidebar-subtree-line-prefix "__")
;;  (setq dired-sidebar-theme 'vscode)
;;  (setq dired-sidebar-use-term-integration t)
;;  (setq dired-sidebar-use-custom-font t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

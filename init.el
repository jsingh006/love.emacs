
;; ~~~~~~ emacs config <3 ~~~~~~
;; ~~~~~ crafted with love ~~~~~
;; ~~~~~~~~~~~~👉👈~~~~~~~~~~~~~

(setq inhibit-startup-message t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 0)
(recentf-mode 1)
(electric-pair-mode 1)



(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(use-package frame
  :straight (:type built-in)
  :config
  ;; Make a clean & minimalist frame
  (setq-default initial-frame-alist
                (append (list
                         '(fullscreen . maximized)
                         '(internal-border-width . 20)
                         '(tool-bar-lines . 0)
                         '(menu-bar-lines . 0)
                         '(vertical-scroll-bars . nil)
                         '(horizontal-scroll-bars . nil)
                         '(height . 45)
                         '(width . 85)
                         )))
  (setq-default default-frame-alist
                (append (list
                         '(frame-title-format . nil)
                         '(internal-border-width . 20)
                         '(tool-bar-lines . 0)
                         '(menu-bar-lines . 0)
                         '(vertical-scroll-bars . nil)
                         '(horizontal-scroll-bars . nil)
                         )))
  ;; Resize pixel-wise to avoid gaps
  (setq-default window-resize-pixelwise t)
  (setq-default frame-resize-pixelwise t)
  ;; Don't show icon in frame
  (setq-default ns-use-proxy-icon nil))

(use-package frame
  :straight (:type built-in)
  :custom
  (window-divider-default-right-width 12)
  (window-divider-default-bottom-width 1)
  (window-divider-default-places 'right-only)
  (window-divider-mode t))
;; Make sure new frames use window-divider
(add-hook 'before-make-frame-hook 'window-divider-mode)

(add-hook 'before-make-frame-hook 'window-divider-mode)

(use-package fontset
  :straight (:type built-in)
  :custom
  (use-default-font-for-symbols t)
  :config
  (when (member "Symbola" (font-family-list))
    (set-fontset-font
     t 'symbol "Symbola" nil))
  (when (member "Apple Color Emoji" (font-family-list))
    (set-fontset-font
     t 'unicode (font-spec :family "Apple Color Emoji") nil 'append))
  )

(use-package all-the-icons-dired
  :if (display-graphic-p)
  :defer t
  :commands all-the-icons-dired-mode
  :init
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package info-colors
  :straight (:host github :repo "ubolonton/info-colors")
  :defer t
  :config
  (add-hook 'Info-selection-hook 'info-colors-fontify-node))

(use-package dimmer
  :straight (:host github :repo "gonewest818/dimmer.el")
  :hook (after-init . dimmer-mode)
  :config
  (setq dimmer-fraction 0.5)
  (setq dimmer-adjustment-mode :foreground)
  (setq dimmer-use-colorspace :rgb)
  (setq dimmer-watch-frame-focus-events nil)
  (dimmer-configure-which-key)
  (dimmer-configure-magit)
  (dimmer-configure-posframe))

(use-package bespoke-themes
  :straight (:host github :repo "mclear-tools/bespoke-themes" :branch "main")
  :config
  (setq bespoke-set-evil-cursors t)
  (setq bespoke-set-italic-comments t
        bespoke-set-italic-keywords t)
  (setq bespoke-set-variable-pitch t)
  (setq bespoke-set-theme 'light)
  (load-theme 'bespoke t))

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "Welcome to GNU Emacs 28.1")
  (setq dashboard-startup-banner "~/Pictures/lolis/kek.png")
  (setq dashboard-center-content t)
  (setq dashboard-set-init-info t)
  (setq dashboard-items '((recents . 3)))
  (setq dashboard-set-file-icons t)
  (dashboard-setup-startup-hook))

(use-package bespoke-modeline
  :straight (:type git :host github :repo "mclear-tools/bespoke-modeline")
  :init
  (setq bespoke-modeline-position 'top)
  (setq bespoke-modeline-size 2)
  (setq bespoke-modeline-git-diff-mode-line t)
  (setq bespoke-modeline-cleaner t)
  (setq bespoke-modeline-vc-symbol "")
  :config
  (bespoke-modeline-mode))

(provide 'setup-modeline)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(set-face-attribute 'default nil :font "CartographCF Nerd Font")

(setq frame-resize-pixelwise t)
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
;;(add-to-list 'default-frame-alist '(ns-appearance . dark))

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org"   . "https://orgmode.org/elpa/")
			 ("elpa"  . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)

(use-package evil)

(require 'ivy)
(ivy-mode 1)

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(use-package ivy)

;; (add-to-list 'load-path "~/.emacs.d/extension")
;; (require 'splash-screen)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(add-hook 'after-init-hook 'global-company-mode)

;; macos settings

(setq select-enable-clipboard t)
(setq save-interprogram-paste-before-kill t)
(setq IS-LINUX (eq system-type 'gnu/linux)
      IS-MAC (eq system-type 'darwin))
(setq inhibit-startup-echo-area-message "jnyandeepsingh")

(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (expt 2 23))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bespoke-modeline-gui-mod-symbol " ❦ ")
 '(bespoke-modeline-gui-ro-symbol " ❃ ")
 '(bespoke-modeline-gui-rw-symbol " ❤︎ ")
 '(bespoke-modeline-space-bottom -0.08)
 '(bespoke-modeline-space-top 0.08)
 '(custom-safe-themes
   '("9fef9580f3503c9d7a8e55c0bacc2bf86800f7a477fbbbd22321587149537038" "c7000071e9302bee62fbe0072d53063da398887115ac27470d664f9859cdd41d" default))
 '(package-selected-packages '(dracula-theme magit which-key counsel evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bespoke-modeline-active-status-** ((t (:box (:line-width (1 . 1) :color "#960d36") :foreground "#fffef9" :background "#960d36"))))
 '(bespoke-modeline-active-status-RO ((t (:box (:line-width (1 . 1) :color "#e0a500") :foreground "#fffef9" :background "#e0a500"))))
 '(bespoke-modeline-active-status-RW ((t (:background "#30608c" :foreground "#fffef9" :box (:line-width (1 . 1) :color "#30608c" :style released-button)))))
 '(bespoke-modeline-visual-bell ((t (:slant normal :family "CartographCF Nerd Font"))))
 '(dashboard-banner-logo-title ((t (:inherit default :weight bold))))
 '(font-lock-comment-face ((t (:slant italic :family "CartographCF Nerd Font"))))
 '(font-lock-keyword-face ((t (:slant italic)))))

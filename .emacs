;; Emacs General configuration

(setq inhibit-startup-message t)        ; Disables the startup message of Emacs
(scroll-bar-mode -1)                    ; Disables the scroll bar on the right


(menu-bar-mode -1)                      ; Removes the menu bar
(tool-bar-mode -1)                      ; Removes the tool bar
(tooltip-mode -1)                       ; Removed the tooltip
(set-fringe-mode 10)                    ; Adds some padding around the text area for editing

(setq visible-bell t)                   ; Removed sound for a visible bell.

;; Font settings: you can enter the font you like be uncommenting
;; This line and changing the :font attribtue.

;;(set-face-attribute 'default nil :font "Fira Code Retina" :height 170)

;; Package Management and sources
;; Do not touch to much if you don't know what you are doing ?
;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))


;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-install package)))

(require 'use-package)
 (setq use-package-always-ensure t)

;; Aestetics
(use-package all-the-icons
  :ensure t
  )
					; Theme with Doom Theme <3
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-challenger-deep t)           ; Change this line with the theme of your choice
                                     ; You can find themes on https://github.com/doomemacs/themes
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config))

					; Modeline with Doom Modeline <3
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 35)))

;; C# packages
(use-package tree-sitter :ensure t)
(use-package tree-sitter-langs :ensure t)
(use-package tree-sitter-indent :ensure t)

(use-package csharp-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.cs\\'" . csharp-tree-sitter-mode)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" default))
 '(package-selected-packages
   '(lorem-ipsum magit expand-region jedi shell-pop shell-here ivy move-text csharp-mode tree-sitter-indent tree-sitter-langs tree-sitter doom-modeline use-package multiple-cursors doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; (set-face-attribute 'default nil :font "JetBrains Mono" :height 160)

(use-package multiple-cursors
  :ensure t
  )
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; activate line numbering in all buffers/modes
(global-display-line-numbers-mode)
(setq-default display-line-numbers-type 'relative)


(use-package move-text
  :ensure t
  )
(require 'move-text)
(move-text-default-bindings)

(delete-selection-mode)

(global-set-key (kbd "C-v") 'yank)

(use-package ivy
  :ensure t
  )
(require 'ivy)
(ivy-mode)

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-d") 'duplicate-line)


(use-package magit
  :ensure t
  )
(require 'magit)


(use-package lorem-ipsum
  :ensure t
  )
(require 'lorem-ipsum)
(lorem-ipsum-use-default-bindings)

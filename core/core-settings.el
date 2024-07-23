;; -*- lexical-binding: t -*-

;; user name
(setq user-full-name "crb331")

;; backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
    backup-by-copying t
    version-control t
    delete-old-versions t
    kept-new-versions 20
    kept-old-versions 5
)

;; Do not show the startup screen
(setq inhibit-startup-message t)
(setq visible-bell t)

;; Disable tool bar, menu bar, scroll bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;;
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default fill-column 80)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(delete-selection-mode t)
(electric-pair-mode 1)

;; Display line numbers in every buffer
(column-number-mode)
(global-display-line-numbers-mode 1)

;; Highligh current line
(global-hl-line-mode t)


;; Configuracion de la fuente
(set-face-attribute 'default nil :family "JetBrains Mono" :height 105 :weight 'Regular)

(provide 'core-settings)

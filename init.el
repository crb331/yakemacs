;; init.el --- Emacs configuration of crb331 -*- lexical-binding: t -*-
;;
;; The default is 800 kilobytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; Emacs 29?
(unless (>= emacs-major-version 29)
  (error "Yak Emacs requires Emacs version 29 or later"))

;; Add Directories to load path
(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "plugins" user-emacs-directory))

;; load core
(require 'core-settings)
(require 'core-keybindings)

;; load plugins
(require 'plugin-main)

;; Establecer archivos de paquetes
(use-package package
  :config
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/")
               '("gnu" . "https://elpa.gnu.org/packages/"))
  (package-initialize))

;; Gestion de paquetes
(use-package use-package
  :custom
  (use-package-always-ensure t)
  (package-native-compile t)
  (warning-minimun-level :error))

;; Make gc pauses faster by decresing the threshold
(setq gc-cons-threshold (* 2 1000 1000))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(nerd-icons dashboard all-the-icons undo-tree consult orderless marginalia doom-themes powerline-evil evil-leader evil vertico which-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

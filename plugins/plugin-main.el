;; -*- lexical-binding: t -*-


;; all the icons
(use-package all-the-icons
  :if (display-graphic-p))

;; Guarda el historico
(use-package savehist
  :init
  (savehist-mode))

;; Which key
(use-package which-key
  :config
  (which-key-mode))

;; Vertico
(use-package vertico
  :init
  (vertico-mode)
  :custom
  (vertico-count 13)
  (vertico-resize t)
  (vertico-cycle t)
  (vertico-sort-function 'vertico-sort-history-alpha)
  :bind (:map vertico-map
              ("C-j" . vertico-next)
              ("C-k" . vertico-previous)
              ("C-f" . vertico-exit)
              :map minibuffer-local-map
              ("C-h" . backward-kill-word))
)


;; Orderless
(use-package orderless
      :custom
      (completion-styles '(orderless basic))
      (completion-category-defaults nil)
      (completion-category-overrides
       '((file (styles partial-completion)))))



;; Marginalia
(use-package marginalia
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))


;; Consult -- Proporciona comandos de busquedad y navegacion --
(use-package consult
      :bind (
             ("C-c M-x" . consult-mode-command)
             ;; ("C-c k" . consult-kmacro)
             ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
             ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
             ("M-y" . consult-yank-pop)                ;; orig. yank-pop
             ("M-g o" . consult-outline)               ;; Alternativa: consult-org-heading
             ("M-g i" . consult-imenu)
             ("M-g I" . consult-imenu-multi)
             ("M-s d" . consult-find)                  ;; Alternativa: consult-fd
             ("M-s g" . consult-grep)
             ("M-s l" . consult-line)))

;; Hacer/deshacer
(use-package undo-tree
      :init
      (global-undo-tree-mode 1)
      :custom
      (undo-tree-visualizer-timestamps t)
      (undo-tree-visualizer-diff t)
      (undo-tree-auto-save-history nil))


;; Evil mode (vi layer for Emacs )
(use-package evil
  :ensure t
  :config

  (evil-mode 1)
  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode t)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
     "s s" 'swiper
     "d x w" 'delete-trailing-whitespace))
  
  (use-package powerline-evil
    :ensure t
    :config
    (powerline-evil-vim-color-theme)))

;; Doom themes
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-gruvbox t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-gruvbox") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))


;; Dashboard
(use-package all-the-icons)

(setq dashboard-icon-type 'all-the-icons)
(use-package dashboard
      :custom
      (dashboard-startup-banner "~/.emacs.d/images/yak-animal.jpg")
      (dashboard-banner-logo-title (format "Yak Emacs"))
      (dashboard-items '((recents . 4)
                         (bookmarks . 4)
                         (agenda . 3)))
      :config
      (dashboard-setup-startup-hook)
      (setq dashboard-set-heading-icons t
            dashboard-set-file-icons t
            dashboard-set-init-info t
            dashboard-set-navigator t
            dashboard-center-content t
            dashboard-vertically-center-content t)
      (setq dashboard-navigator-buttons
            `((
               (,(when (display-graphic-p)
                   (all-the-icons-octicon "home" :height 1.1 :v-adjust 0.0))
                "Página web" "El Blog de Lázaro"
                (lambda (&rest _) (browse-url "https://elblogdelazaro.org")))
               (,(when (display-graphic-p)
                   (all-the-icons-material "home" :height 1.35 :v-adjust -0.24))
                "Localhost" "Abrir Hugo localhost"
                (lambda (&rest _) (browse-url "http://localhost:1313/")))
               (,(when (display-graphic-p)
                   (all-the-icons-octicon "tools" :height 1.0 :v-adjust 0.0))
                "Configuración" "Abrir configuración de emacs (.org)"
                 (lambda (&rest _) (find-file (expand-file-name  "~/.emacs.d/Emacs.org"))))
               (,(when (display-graphic-p)
                   (all-the-icons-octicon "calendar" :height 1.0 :v-adjust 0.0))
                "Agenda" "Agenda personal"
                (lambda (&rest _)
                  (interactive)
                  (if (get-buffer "*Org Agenda*")
                      (progn
                        (switch-to-buffer-other-window "*Org Agenda*")
                        (kill-buffer "*Org Agenda*")
                        (org-agenda-list))
                    (split-window-right)
                    (org-agenda-list))))
               ))))
    ;; F10 para ir al Dashboard
    (global-set-key (kbd "<f10>") 'open-dashboard)
    
    (defun open-dashboard ()
      "Abre el buffer *dashboard* y salta al primer widget."
      (interactive)
      (delete-other-windows)
      ;; Refresca  dashboard buffer
      (if (get-buffer dashboard-buffer-name)
          (kill-buffer dashboard-buffer-name))
      (dashboard-insert-startupify-lists)
      (switch-to-buffer dashboard-buffer-name))




;; Nerd Icons
(use-package nerd-icons
  :custom

  (nerd-icons-font-family "JetBrainsMono Nerd Font Mono")
  )




(provide 'plugin-main)

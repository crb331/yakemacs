;; -*- lexical-binding: t -*-

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)

;; No preguntar antes de matar un buffer
(global-set-key [remap kill-buffer] #'kill-this-buffer)


(provide 'core-keybindings)

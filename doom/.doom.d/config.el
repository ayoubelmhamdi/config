;;; config.el -*- lexical-binding: t; -*-
;; Plagin config:
(package-initialize) ;; first
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(ido-mode 1) ;; not a smex, just a builting emacs

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; user config:
;;;

(setq user-full-name "Ayoub Elmhamdi"
      user-mail-address "ayoub.elmhamdi@gmail.com")



(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 15))
      ;;doom-variable-pitch-font (font-spec :family "ETBembo" :size 18)
      ;; doom-variable-pitch-font (font-spec :family "Alegreya" :size 18))

(setq org-directory "~/org/")
(blink-cursor-mode 2)

(setq inhibit-splash-screen t)
(setq confirm-kill-emacs nil)



(xterm-mouse-mode 1)
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq-default c-basic-offset 4)
(setq-default tab-stop-list (number-sequence 4 120 4))
(setq-default tab-always-indent t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)

;; Undo
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))

;; Allow mixed fonts in a buffer. This is particularly useful for Org mode, so I can mix source and prose blocks in the same document. I also manually enable solaire-mode in Org mode as a workaround for font scaling not working properly.

(add-hook! 'org-mode-hook #'mixed-pitch-mode)
(add-hook! 'org-mode-hook #'solaire-mode)
(setq mixed-pitch-variable-pitch-cursor nil)

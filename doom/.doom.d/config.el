;;; config.el -*- lexical-binding: t; -*-
;; plagin:
(package-initialize) ;; first
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(custom-set-variables
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes '("6f96a9ece5fdd0d3e04daea6aa63e13be26b48717820aa7b5889c602764cf23a" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "691d671429fa6c6d73098fc6ff05d4a14a323ea0a18787daeb93fde0e48ab18b" "d6b934330450d9de1112cbb7617eaf929244d192c4ffb1b9e6b63ad574784aad" "e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7" default))
  (setq doom-theme '(gruber-darker-theme))
)

(setq user-full-name "Ayoub Elmhamdi"
      user-mail-address "ayoub.elmhamdi@gmail.com")


;;; user config:

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

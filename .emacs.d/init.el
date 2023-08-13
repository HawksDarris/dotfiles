(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(nil))
 '(custom-safe-themes
   '("7b8f5bbdc7c316ee62f271acf6bcd0e0b8a272fdffe908f8c920b0ba34871d98" default))
 '(package-selected-packages '(gruvbox-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'package)
    (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package org)

;;; Vim stuff when editing
(use-package evil
  :demand t
	:bind (("<escape>" . keyboard-escape-quit))
	:init
	;; allows for using cgn
	;; (setq evil-search-module 'evil-search)
	(setq evil-want-keybinding nil)
	;; no insert bindings
	(setq evil-undo-system 'undo-fu)
  :config
  (evil-mode 1))

;(dolist (package '(evil-vimish-fold evil-args evil-nerd-commenter evil-goggles evil-numbers evil-cleverparens evil-escape evil-exchange evil-quickscope evil-textobj-syntax evil-tex evil-snipe evil-owl evil-easymotion evil-surround evil-multiedit goto-chg))
;  (eval `(use-package package
;    :ensure t)))
(use-package evil-vimish-fold
  :ensure t)

(use-package evil-args
  :ensure t)

(use-package evil-nerd-commenter
  :ensure t)

(use-package evil-goggles
  :ensure t)

(use-package evil-numbers
  :ensure t)

(use-package evil-cleverparens
  :ensure t)

(use-package evil-escape
  :ensure t)

(use-package evil-exchange
  :ensure t)

(use-package evil-quickscope
  :ensure t)

(use-package evil-textobj-syntax
  :ensure t)

(use-package evil-tex
  :ensure t)

(use-package evil-snipe
  :ensure t)

(use-package evil-owl
  :ensure t)

(use-package evil-easymotion
  :ensure t)

(use-package evil-surround
  :ensure t)

(use-package evil-multiedit
  :ensure t)

(use-package goto-chg
  :ensure t)

;;; Still need to figure out how to use vim when not editing. Maybe. I guess it doesn't matter too much.

; Themes
(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox))

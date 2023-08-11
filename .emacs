(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(nil))
 '(custom-safe-themes
   '("7b8f5bbdc7c316ee62f271acf6bcd0e0b8a272fdffe908f8c920b0ba34871d98" default))
 '(package-selected-packages '(gruvbox-theme evil-goggles evil)))
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

;;; Vim stuff when editing
(use-package evil
  :demand t
	:bind (("<escape>" . keyboard-escape-quit))
	:init
	;; allows for using cgn
	;; (setq evil-search-module 'evil-search)
	(setq evil-want-keybinding nil)
	;; no im insert bindings
	(setq evil-undo-system 'undo-fu)
  :config
  (evil-mode 1))

;;; Use vim when not editing
(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox))

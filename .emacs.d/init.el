(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(nil))
 '(custom-safe-themes t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(
     linum-relative babel org-contrib dashboard lsp-ui lsp-mode
   treemacs use-package-ensure-system-package spacemacs-theme notmuch
   gruvbox-theme goto-chg evil-vimish-fold evil-textobj-syntax
   evil-tex evil-surround evil-snipe evil-quickscope evil-owl
   evil-numbers evil-nerd-commenter evil-multiedit evil-goggles
   evil-exchange evil-escape evil-easymotion evil-cleverparens
   evil-args
   ))
 '(safe-local-variable-values '((org-confirm-babel-evaluate)))
 '(use-package-use-theme t))
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

(use-package org-contrib)

;;; Vim stuff when editing
(use-package evil
  :demand t
	:bind (("<escape>" . keyboard-escape-quit))
	:init
	(setq evil-want-keybinding nil)
	(setq evil-undo-system 'undo-tree)
  :config
  (evil-mode 1))

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

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

(use-package treemacs
  :ensure t)

(use-package lsp-mode
  :ensure t)

(use-package lsp-ui
  :ensure t)

; Themes
(use-package spacemacs-theme
  :ensure t
  :config
  (load-theme 'spacemacs-dark t))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

; Babel org code execution
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (shell . t)
   (R . t)
   (latex . t)
   (js . t)))

; Emacs basics
(setq display-line-numbers 'relative)
(global-display-line-numbers-mode 1)
(use-package linum-relative
  :ensure t
  :config
  (linum-relative-global-mode))

;(evil-ex-define-cmd "e[dit]" 'find-file)
(defun evil-ex-find-file ()
  (interactive)
  (let ((current-prefix-arg nil))
    (call-interactively 'find-file)))

(evil-ex-define-cmd "e[dit]" 'evil-ex-find-file)

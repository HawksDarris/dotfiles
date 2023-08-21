(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(nil))
 '(custom-safe-themes t)
 '(inhibit-startup-screen t)
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-doi ol-eww ol-gnus ol-info ol-irc ol-mhe ol-rmail org-tempo ol-w3m))
 '(package-selected-packages
   '(yasnippet linum-relative babel org-contrib dashboard lsp-ui lsp-mode treemacs use-package-ensure-system-package spacemacs-theme notmuch gruvbox-theme goto-chg evil-vimish-fold evil-textobj-syntax evil-tex evil-surround evil-snipe evil-quickscope evil-owl evil-numbers evil-nerd-commenter evil-multiedit evil-goggles evil-exchange evil-escape evil-easymotion evil-cleverparens evil-args))
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
  :defer t
  :init
  (global-undo-tree-mode))

(use-package evil-vimish-fold
  :defer t)

(use-package evil-args
  :defer t)

(use-package evil-nerd-commenter
  :defer t)

(use-package evil-goggles
  :defer t)

(use-package evil-numbers
  :defer t)

(use-package evil-cleverparens
  :defer t)

(use-package evil-escape
  :defer t)

(use-package evil-exchange
  :defer t)

(use-package evil-quickscope
  :defer t)

(use-package evil-textobj-syntax
  :ensure t)

(use-package evil-tex
  :defer t)

(use-package evil-snipe
  :defer t)

(use-package evil-owl
  :defer t)

(use-package evil-easymotion
  :defer t)

(use-package evil-surround
  :defer t)

(use-package evil-multiedit
  :defer t)

(use-package goto-chg
  :defer t)

(use-package treemacs
  :defer t)

(use-package lsp-mode
  :defer t)

(use-package lsp-ui
  :defer t)

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
  :defer t
  :config
  (linum-relative-global-mode))

; Make :e RET execute find-file (I assume there's a better way to do this)
(defun evil-ex-find-file ()
  (interactive)
  (let ((current-prefix-arg nil))
    (call-interactively 'find-file)))

; Make tab work in normal mode on org
(evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)

; Add values to TODO cycle on org mode
(setq org-todo-keywords
      '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))

;; Set the number of days before a deadline that Org mode will start warning you
(setq org-deadline-warning-days 7)

;; Set the location where archived items should be stored
(setq org-archive-location "~/.emacs.d/org/archive.org::datetree/")

;; Function to archive all DONE items
(defun org-archive-done-tasks ()
  (when (eq major-mode 'org-mode)
    (org-map-entries
     (lambda ()
       (org-archive-subtree)
       (setq org-map-continue-from (outline-previous-heading)))
     "/DONE" 'file)))

;; Function to remove an org item and its subtree
(defun org-remove-subtree ()
  (when (eq major-mode 'org-mode)
    (delete-region (org-back-to-heading) (org-end-of-subtree t t))))

;; call to archive DONE items when that org buffer is killed
(add-hook 'kill-buffer-hook 'org-archive-done-tasks)
(add-hook 'kill-buffer-hook 'org-remove-subtree)

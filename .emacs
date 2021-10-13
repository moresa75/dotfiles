;; Change to your .emacs.d/ directory accordingly
(setq user-emacs-directory "/Users/reza/.emacs.d") 
(require 'package)

(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("7923541211298e4fd1db76c388b1d2cb10f6a5c853c3da9b9c46a02b7f78c882" default))
 '(package-selected-packages '(gruber-darker-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'use-package)
(use-package evil
             :ensure t)

(evil-mode 1)
(use-package org
             :ensure t)
(use-package use-package-chords
             :ensure t
             :config (key-chord-mode 1))

(key-chord-define evil-normal-state-map "jk" 'evil-force-normal-state)
(key-chord-define evil-visual-state-map "jk" 'evil-change-to-previous-state)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-replace-state-map "jk" 'evil-normal-state)

(use-package magit
             :ensure t)

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(setq make-backup-files nil)
(global-display-line-numbers-mode 1)

(set-face-attribute 'default nil :font "Menlo" :height 140)

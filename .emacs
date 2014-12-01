; colors
(add-to-list 'custom-theme-load-path
	     "~/.emacs.d/themes/emacs-color-theme-solarized")

; yin`s
(setq visible-bell t)
(setq inhibit-startup-message t)
(setq linum-mode t)
;(setq mouse-yank-at-point t)
;(setq kill-ring-max 200)
;(setq default-fill-column 80)
;(setq-default indent-tabs-mode nil)
;(setq default-tab-width 8)
;(setq tab-stop-list ())
(setq user-full-name "judasnow")
(setq user-mail-address "judasnow@gmail.com")

 
; no toolbar
(tool-bar-mode 0) 
(menu-bar-mode 0) 
(scroll-bar-mode 0)

; font
(set-default-font "monaco 15")
(load-theme 'solarized-dark t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "~/.cask/cask.el")

(cask-initialize)

(load-file "~/.emacs.conf/init.el")

;; General Auto-Complete
;; (require 'auto-complete-config)
;; (setq ac-delay 0.0)
;; (setq ac-quick-help-delay 0.5)
;; (ac-config-default)

(load-file "~/.emacs.conf/emacs_clojure.el")

(require 'multiple-cursors)

(load-file "~/.emacs.conf/init_keybinding.el")

(load-file "~/.emacs.conf/emacs_web.el")

;; (load-file "~/.emacs.conf/emacs_latex.el")

;; Show parenthesis mode
(show-paren-mode 1)

;; rainbow delimiters
(require 'rainbow-delimiters)

(require 'cask "~/.cask/cask.el")
(cask-initialize)


;; Noctilus Theme
(load-theme 'noctilux t)

;; (load-theme 'zenburn t)
;; elscreen
(elscreen-start)

;; ido mode
(ido-mode 1)


;; Use only spaces (no tabs at all).
(setq-default indent-tabs-mode nil)


;; Always show column numbers.
(setq-default column-number-mode t)

;; Display full pathname for files.
(add-hook 'find-file-hooks
        '(lambda ()
          (setq mode-line-buffer-identification 'buffer-file-truename)))

;; For easy window scrolling up and down.
(global-set-key "\M-n" 'scroll-up-line)
(global-set-key "\M-p" 'scroll-down-line)

;; For easier regex search/replace.
(defalias 'qrr 'query-replace-regexp)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2 t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(package-selected-packages
   (quote
    (csv-mode php-mode swift-mode inf-mongo coffee-mode package-build shut-up epl git commander f dash s))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setenv "PATH" (concat (getenv "PATH") ":~/bin"))
(setq exec-path (append exec-path '("~/bin")))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)


;;;;;; grunt. experimental ;;;;;;;;

(defun grunt-test-e2e ()
  "Run grunt test e2e"
  (interactive)
  (let* ((grunt-buffer (get-buffer-create "*grunt*"))
        (result (call-process-shell-command "grunt test:e2e" ))
        (output (with-current-buffer grunt-buffer (buffer-string))))
    (cond ((zerop result)
           (message "Grunt completed without errors"))
          (t
           (message nil)
           (split-window-vertically)
           (set-window-buffer (next-window) grunt-buffer)))))

;; js


(add-to-list 'auto-mode-alist '("\\.js" . js-mode))
(add-to-list 'auto-mode-alist '("\\.html" . web-mode))

;; easy spell check
(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
(global-set-key (kbd "C-M-<f8>") 'flyspell-buffer)
(global-set-key (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )
(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)


;; tabs

(setq-default indent-tabs-mode nil)

(setq tab-width 2) ; or any other preferred value
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)


;; company-mode 4 all
(add-hook 'after-init-hook 'global-company-mode)
(global-company-mode)


;; coffescript



(eval-after-load "coffee-mode"
  '(progn
     (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
     (define-key coffee-mode-map (kbd "C-j") 'coffee-newline-and-indent)))


;; emmet

(add-hook 'html-mode-hook 'emmet-mode) ;; Auto-start on

(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent 2 spaces.

(setq emmet-move-cursor-between-quotes t) ;; move to first empty quotes

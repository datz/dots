(load-file "~/.emacs.conf/init.el")

;; General Auto-Complete
(require 'auto-complete-config)
(setq ac-delay 0.0)
(setq ac-quick-help-delay 0.5)
(ac-config-default)

(load-file "~/.emacs.conf/emacs_clojure.el")

(require 'multiple-cursors)

(load-file "~/.emacs.conf/init_keybinding.el")

(load-file "~/.emacs.conf/emacs_latex.el")

;; Show parenthesis mode
(show-paren-mode 1)

;; rainbow delimiters
(global-rainbow-delimiters-mode)

;; Noctilus Theme
(load-theme 'noctilux t)

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
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Oxygen Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))

(setenv "PATH" (concat (getenv "PATH") ":~/bin"))
(setq exec-path (append exec-path '("~/bin")))

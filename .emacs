(require 'package)
(add-to-list 'package-archives
          '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
          '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(global-set-key "\C-cd" 'kill-whole-line)
(global-set-key (kbd "C-x O") 'previous-multiframe-window)

;; RETURN is now newline and ident!
(add-hook 'lisp-mode-hook '(lambda ()
     (local-set-key (kbd "RET") 'newline-and-indent)))

(require 'tramp)

(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-mode t)
 '(auto-save-default nil)
 '(backup-inhibited t t)
 '(cursor-type 'bar t)
 '(column-number-mode t)
 '(cursor-type (quote bar) t)
 '(custom-safe-themes (quote ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(delete-selection-mode t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t
          (:family "Inconsolata"
                 :foundry "unknown"
                 :slant normal
                 :weight normal
                 :height 137
                 :width normal)))))
(setq-default inhibit-startup-screen t)

;; Of course, don't uncomment the line below -- doing so would
;; stop Emacs from helpfully leaving "foo~" (backup) files all
;; over the place.
;(setq make-backup-files nil)


;; elscreen
(elscreen-start)

;; rainbow delimiters
(global-rainbow-delimiters-mode)

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

;; My own preference. Change or comment out the following lines if you like.
(load-theme 'deeper-blue t)
(set-background-color "#383838")
(set-face-background 'region "yellow")

;; paredit
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'paredit-mode)
(global-set-key [f7] 'paredit-mode)

;; nrepl
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*nrepl*")
(add-hook 'nrepl-mode-hook 'paredit-mode)
;; starts nrepl-hack-in with f9
(global-set-key [f9] 'nrepl-jack-in)

;; Auto complete
(require 'auto-complete-config)
(ac-config-default)
(define-key ac-completing-map "\M-/" 'ac-stop) ; use M-/ to stop completion
;; ac-nrepl
(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete" '(add-to-list 'ac-modes 'nrepl-mode))

(setenv
 "PATH"
 (concat
  "/home/patz/bin" ":"
  (getenv "PATH")))

;; resize window
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)


;; kibit (https://github.com/jonase/kibit)

;; Teach compile the syntax of the kibit output
(require 'compile)
(add-to-list 'compilation-error-regexp-alist-alist
       '(kibit "At \\([^:]+\\):\\([[:digit:]]+\\):" 1 2 nil 0))
(add-to-list 'compilation-error-regexp-alist 'kibit)

;; A convenient command to run "lein kibit" in the project to which
;; the current emacs buffer belongs to.
(defun kibit ()
  "Run kibit on the current project.
Display the results in a hyperlinked *compilation* buffer."
  (interactive)
  (compile "lein kibit"))

(defun kibit-current-file ()
  "Run kibit on the current file.
Display the results in a hyperlinked *compilation* buffer."
  (interactive)
  (compile (concat "lein kibit " buffer-file-name)))


;; Move with Shift+{left,up,down,right}
(windmove-default-keybindings)
(setq windmove-wrap-around t)


;; LaTeX

;;(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)
;;  
;;  (add-hook 'Latex-mode-hook 'ac-l-setup)
;;  
;;  (add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; Activar reftex con AucTex
;;  (setq reftex-plug-intoAUCTeX t) ; Conectar a AUC TeX con RefTeX
;;  (add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
;;  (setq latex-run-command "pdflatex")
;;  V

(put 'downcase-region 'disabled nil)

;; ask before closing

(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
     (if (< emacs-major-version 22)
        (save-buffers-kill-terminal)
      (save-buffers-kill-emacs))
   (message "Canceled exit")))

(global-set-key (kbd "C-x C-c") 'ask-before-closing)


(menu-bar-mode -1)

;; cider-error with cider-mode
;; (add-hook 'cider-popup-buffer-mode-hook 'cider-mode)

;; hide special buffers 
(setq nrepl-hide-special-buffers t)

;; Stop the error buffer from popping up while working in buffers other than the REPL:
;; (setq cider-popup-stacktraces nil)

;; Limit the number of items of each collection the printer will print to 100:
(setq cider-repl-print-length 100)

;; Prevent C-c C-k from prompting to save the file corresponding to the buffer being loaded, if it's modified:
;; (setq cider-prompt-save-file-on-load nil)

;; To make the REPL history wrap around when its end is reached:
(setq cider-repl-wrap-history t)

;;To adjust the maximum number of items kept in the REPL history:
(setq cider-repl-history-size 1000) ; the default is 500

;;To store the REPL history in a file:
(setq cider-repl-history-file "~/.emacs_repl_history")

(add-hook 'Clojure 'rainbow-delimiters-mode)

(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)



(require 'clj-refactor)
(add-hook 'clojure-mode-hook
          (lambda ()
            (clj-refactor-mode 1)
            (cljr-add-keybindings-with-prefix "C-c C-m")))
;; autofill
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;;; LaTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ;; Acticar reftex con AucTeX
(setq reftex-plug-into-AUCTeX t) ; Conectar a AUC TeX con RefTeX
(setq TeX-default-mode 'LaTeX-mode)
(setq TeX-force-default-mode t)
(setq TeX-electric-escape t)
>>>>>>> 6dc2bbbd673edc4fecc5cddb2b2121fddafbb40e

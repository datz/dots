(require 'package)

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/"))

(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))


; Initialize all the ELPA packages (what is installed using the packages commands)
(package-initialize)

(custom-set-variables

'(inhibit-startup-screen t)

'(initial-scratch-message nil))

;; scroll one line at a time (less "jumpy" than defaults)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time


(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))

(global-set-key (kbd "C-x C-c") 'ask-before-closing)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'magit-status-mode-hook 'magit-filenotify-mode )

;transparency
(set-frame-parameter (selected-frame) 'alpha '(95 90))
; no menu bar
(menu-bar-mode 0)


(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(require 'expand-region)

(global-set-key (kbd "C-=") 'er/expand-region)


;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))

(global-whitespace-mode 1)

(custom-set-variables '(coffee-tab-width 2))

;; coffee mode
(eval-after-load "coffee-mode"
  '(progn
     (define-key coffee-mode-map (kbd "C-j") 'coffee-newline-and-indent)))

(setenv "EDITOR" "emacsclient")


(defun fmongo () (interactive) (inf-mongo "mongo fractal3.fractal-ware.com,fractal1.fractal-ware.com,fractal2.fractal-ware.com/fractal -u fractal  -p 5jceHqRY"))

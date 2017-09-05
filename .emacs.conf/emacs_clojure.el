;;;;;;;;;;;;;;;;;;
;; clojure-mode ;;
;;;;;;;;;;;;;;;;;;

(require 'cider-eval-sexp-fu)

(add-hook 'clojure-mode-hook 'cider-mode)

(global-company-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

(add-hook 'cider-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))

(show-paren-mode 1)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(add-to-list 'custom-theme-load-path "~/.emacs.d/lib/monokai-theme")
(load-theme 'monokai t)


;;
;; Update the color of the company-mode context menu to fit the Monokai theme
;; @source: https://github.com/search?q=deftheme+company-tooltip&type=Code
;;
(deftheme monokai-overrides)

(let ((class '((class color) (min-colors 257)))
      (terminal-class '((class color) (min-colors 89))))

  (custom-theme-set-faces
   'monokai-overrides

   ;; Linum and mode-line improvements (only in sRGB).
   `(linum
     ((,class :foreground "#75715E"
              :background "#49483E")))
   `(mode-line-inactive
     ((,class (:box (:line-width 1 :color "#2c2d26" :style nil)
                    :background "#2c2d26"))))

   ;; Custom region colouring.
   `(region
     ((,class :foreground "#75715E"
              :background "#49483E")
      (,terminal-class :foreground "#1B1E1C"
                       :background "#8B8878")))

   ;; Additional modes
   ;; Company tweaks.
   `(company-tooltip-common
     ((t :foreground "#F8F8F0"
         :background "#474747"
         :underline t)))

   `(company-template-field
     ((t :inherit company-tooltip
         :foreground "#C2A1FF")))

   `(company-tooltip-selection
     ((t :background "#349B8D"
         :foreground "#BBF7EF")))

   `(company-tooltip-common-selection
     ((t :foreground "#F8F8F0"
         :background "#474747"
         :underline t)))

   `(company-scrollbar-fg
     ((t :background "#BBF7EF")))

   `(company-tooltip-annotation
     ((t :inherit company-tooltip
         :foreground "#C2A1FF")))

   ;; Popup menu tweaks.
   `(popup-menu-face
     ((t :foreground "#A1EFE4"
         :background "#49483E")))

   `(popup-menu-selection-face
     ((t :background "#349B8D"
         :foreground "#BBF7EF")))

   ;; Circe
   `(circe-prompt-face
     ((t (:foreground "#C2A1FF" :weight bold))))

   `(circe-server-face
     ((t (:foreground "#75715E"))))

   `(circe-highlight-nick-face
     ((t (:foreground "#AE81FF" :weight bold))))

   `(circe-my-message-face
     ((t (:foreground "#E6DB74"))))

   `(circe-originator-face
     ((t (:weight bold))))))



; Syntax Highlighting
(require 'highlight-symbol)
(global-set-key (kbd "C-é") 'highlight-symbol-at-point)
(global-set-key (kbd "C-.") 'highlight-symbol-next)
(global-set-key (kbd "C-,") 'highlight-symbol-prev)
(global-set-key (kbd "C-;") 'highlight-symbol-query-replace)



;; clj-refactor
;; (require 'clj-refactor)

;; (add-hook 'clojure-mode-hook (lambda ()
;;                                (clj-refactor-mode 1)
;;                                (cljr-add-keybindings-with-prefix "C-c C-m")))

;; (cljr-add-keybindings-with-prefix "C-c C-m")

;; extra-font

(require 'clojure-mode-extra-font-locking)

;; ident
(put-clojure-indent '-> 1)
(put-clojure-indent '->> 1)

;; camelCase

(add-hook 'clojure-mode-hook #'subword-mode)




;; yas
(add-hook 'clojure-mode-hook #'yas-minor-mode)

;; smartparents
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)

;; rainbow delimiters
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

;; paredit
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

;; (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
;; (add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

;;;;;;;;;;;;;;;;;;
;; cider config ;;
;;;;;;;;;;;;;;;;;;
(setq nrepl-hide-special-buffers t)

;; (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)


(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function);; dont show error buffer
(setq cider-show-error-buffer nil)

;Enable error buffer popping also in the REPL:
 (setq cider-repl-popup-stacktraces nil)

;To disable auto-selection of the error (stacktrace) buffer when it's displayed:
 (setq cider-auto-select-error-buffer nil)

;Limit the number of items of each collection the printer will print to 100:
(setq cider-repl-print-length 100) ; the default is nil, no limit

;; Poping-up contextual documentation
(eval-after-load "cider"
  '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))

;; Make C-c C-z switch to the CIDER REPL buffer in the current window:
(setq cider-repl-display-in-current-window t)

;; history
(setq cider-repl-wrap-history t)

(setq cider-repl-history-size 10000)

(setq cider-repl-history-file "/home/patz/.repl_history")

(setq inferior-lisp-program "browser-repl")

;; for classes and methos on repl
(add-hook 'cider-repl-mode-hook #'subword-mode)

;; rainbow delimiters


;;;;;;;;;;;
;; kibit ;;
;;;;;;;;;;;
;;  (https://github.com/jonase/kibit) ;;

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

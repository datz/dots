(require 'clj-refactor)

(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               (cljr-add-keybindings-with-prefix "C-c C-m")))

(cljr-add-keybindings-with-prefix "C-c C-m")

(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)

;(setq nrepl-popup-stacktraces true)
;(add-to-list 'same-window-buffer-names "<em>nrepl</em>")

;; paredit
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; ac-nrepl (Auto-complete for the nREPL)
(require 'ac-nrepl)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-to-list 'ac-modes 'cider-mode)
(add-to-list 'ac-modes 'cider-repl-mode)

;; cider config

;(setq nrepl-hide-special-buffers t)

;; dont show error buffer
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

;; history
(setq cider-repl-wrap-history t)

(setq cider-repl-history-size 10000)

(setq cider-repl-history-file "/home/patz/.repl_history")


;; kibit 

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

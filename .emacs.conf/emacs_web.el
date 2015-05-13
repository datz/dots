;; coffee mode
(eval-after-load "coffee-mode"
  '(progn
     (define-key coffee-mode-map (kbd "C-j") 'coffee-newline-and-indent)))

(setq coffee-tab-width 2) ;; coffeescript
(setq javascript-indent-level 2) ;; javascript-mode
(setq js-indent-level 2) ;; js-mode
(setq js2-basic-offset 2) ;; js2-mode
(setq web-mode-markup-indent-offset 2) ;; web-mode, html tag in html file
(setq web-mode-css-indent-offset 2) ;; web-mode, css in html file
(setq web-mode-code-indent-offset 2) ;; web-mode, js code in html file
(setq css-indent-offset 2) ;; css-mode

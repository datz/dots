(setenv "GOPATH" "$HOME/src/go")

(add-to-list 'exec-path "$GOPATH/bin")


(defun my-go-mode-hook ()
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark))

(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)
(add-hook 'go-mode-hook 'my-go-mode-hook)

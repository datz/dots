(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ;; Acticar reftex con AucTeX
(setq reftex-plug-into-AUCTeX t) ; Conectar a AUC TeX con RefTeX
(setq TeX-default-mode 'LaTeX-mode)
(setq TeX-force-default-mode t)
(setq TeX-electric-escape t)

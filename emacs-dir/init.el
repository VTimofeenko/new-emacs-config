(load-theme 'modus-vivendi-tinted :no-confirm)
(use-package emacs
             ;:config
             (blink-cursor-mode 0)
             (global-display-line-numbers-mode 1)
             (setq display-line-numbers-type 'visual))
(use-package evil
             :config
             (evil-mode 1)
             )

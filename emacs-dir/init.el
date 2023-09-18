(load-theme 'modus-vivendi-tinted :no-confirm)

(use-package emacs
             :init
             (setq inhibit-startup-screen t)
             ;:config
             (blink-cursor-mode 0)
             (global-display-line-numbers-mode 1)
             (setq display-line-numbers-type 'visual))

(use-package evil
             :config
             (evil-mode 1)
             )

(use-package which-key
             :config
             (which-key-mode 1)
             )

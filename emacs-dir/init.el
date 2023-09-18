(load-theme 'modus-vivendi-tinted :no-confirm)

(use-package emacs
             :init
             (setq inhibit-startup-screen t)
             ;:config
             (blink-cursor-mode 0)
             (global-display-line-numbers-mode 1)
             (setq display-line-numbers-type 'visual)
             (setq backup-directory-alist '(("." . "~/.cache/emacs-custom/autosaves"))))

(use-package evil
             :init
             (setq evil-want-keybinding nil)
             :config
             (evil-mode 1)
             (evil-set-leader 'normal (kbd "SPC"))
             (evil-set-leader 'normal (kbd "m")))

(use-package which-key
             :config
             (which-key-mode 1))

(use-package helpful
             :config
             (defun mkMapping(key callable)
               (evil-define-key 'normal 'global (kbd (concat "<leader>h" key)) callable))
             (mkMapping "f" 'helpful-callable)
             (mkMapping "v" 'helpful-variable)
             (mkMapping "c" 'helpful-command))

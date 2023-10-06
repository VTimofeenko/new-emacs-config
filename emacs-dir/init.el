(load-theme 'modus-vivendi-tinted :no-confirm)

;; Prevents random files appearing in random places
;; Since Nix store is read-only, the emacs directory is not writable
(use-package no-littering
             :init
             ;; Kinda makes sense to set here to prevent lock files from appearing next to files that are being edited
             (setq create-lockfiles nil)
             :config
             ;; Saves backups to files into var directory inside user-emacs-directory
             (no-littering-theme-backups))

(use-package emacs
             :init
             (setq inhibit-startup-screen t)
             ;:config
             (blink-cursor-mode 0)
             (global-display-line-numbers-mode 1)
             (setq display-line-numbers-type 'visual)
             (setq ring-bell-function 'ignore))

(use-package evil
             :init
             (setq evil-want-keybinding nil)
             (setq evil-want-C-u-scroll t)
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

(use-package evil-collection
             :after evil
             :ensure t
             :config
             (evil-collection-init))

(use-package projectile
             :init
             :after evil
             :ensure t
             :config
             (projectile-mode 1)
             (evil-define-key 'normal 'global (kbd "<leader>p") 'projectile-command-map)
             (evil-define-key 'normal 'global (kbd "<leader><SPC>") 'projectile-find-file)
             (evil-define-key 'normal 'global (kbd "<leader>/") 'projectile-ripgrep))

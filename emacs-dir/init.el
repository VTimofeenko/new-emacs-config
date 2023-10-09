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
	     (setq scroll-margin 5)
             (setq inhibit-startup-screen t)
             (blink-cursor-mode 0)
             (global-display-line-numbers-mode 1)
             (setq display-line-numbers-type 'visual)
             (setq ring-bell-function 'ignore))

(mapc #'define-prefix-command
      '(evil-application-map
         evil-buffer-map
         evil-error-map
         evil-file-map
         evil-git-map
         evil-global-leader-map
         evil-helpful-map
         evil-insert-map
         evil-jump-map
         evil-option-map
         evil-search-map
         evil-tab-map))

(use-package evil
             :defer nil
             :init
             (setq evil-want-keybinding nil)
             (setq evil-want-C-u-scroll t)
             :bind
             ( :map evil-motion-state-map
                    ("SPC" . evil-global-leader-map)
                    ("M-SPC" . evil-global-leader-map)
                    :map evil-insert-state-map
                    ("M-SPC" . evil-global-leader-map)
                    :map evil-global-leader-map
                    ("a" . evil-application-map)
                    ("b" . evil-buffer-map)
                    ("f" . evil-file-map)
                    ("i" . evil-insert-map)
                    ("j" . evil-jump-map)
                    ("o" . evil-option-map)
                    ("s" . evil-search-map)
                    ("u" . universal-argument)
                    ("h" . evil-helpful-map)
                    ("w" . evil-window-map)
                    :map evil-window-map
                    ("d" . evil-window-delete)
                    :map evil-buffer-map
                    ; ("b" . list-buffers)
                    ("B" . bury-buffer)
                    ("d" . kill-this-buffer)
                    ("e" . eval-buffer)
                    ("m" . view-echo-area-messages)
                    :map evil-file-map
                    ("a" . write-file)
                    ("c" . copy-file)
                    ; ("f" . find-file) ;; Defined in helm so that helm is picked up
                    ("r" . recover-this-file)
                    ("s" . save-buffer)
                    :map evil-jump-map
                    ("f" . find-function)
                    ("v" . find-variable)
                    :map evil-option-map
                    ("f" . display-fill-column-indicator-mode)
                    ("s" . window-toggle-side-windows)
                    ("l" . toggle-truncate-lines)
                    ("n" . display-line-numbers-mode)
                    ("d" . toggle-debug-on-error)
                    ("D" . toggle-debug-on-quit)
                    :map evil-replace-state-map
                    ("M-SPC" . evil-global-leader-map)
                    :map evil-search-map
                    ("c" . evil-ex-nohighlight)
                    ("i" . imenu-list-smart-toggle) )
             :config
             (evil-mode 1)
             ;; Leader
             (evil-set-leader 'normal (kbd "SPC"))
             ;; Local leader
             (evil-set-leader 'normal (kbd "m") t))

(use-package which-key
             :config
             (which-key-mode 1))

(use-package helpful
             :after evil
             :bind (:map evil-helpful-map
                         ("f" . helpful-callable)
                         ("v" . helpful-variable)
                         ("c" . helpful-command)
                         )
             :config
             )

(use-package evil-collection
             :after evil
             :custom (evil-collection-key-blacklist '("SPC"))
             :config
             (evil-collection-init)
             (evil-collection-buff-menu-setup)
             (evil-collection-unimpaired-setup))

(use-package projectile
             :init
             :after evil
             :config
             (projectile-mode 1)
             (evil-define-key 'normal 'global (kbd "<leader>p") 'projectile-command-map)
             (evil-define-key 'normal 'global (kbd "<leader><SPC>") 'projectile-find-file)
             (evil-define-key 'normal 'global (kbd "<leader>/") 'projectile-ripgrep))


;; Persist history through Emacs restarts
(use-package savehist
             :init
             (savehist-mode 1))

(use-package helm
             :init
             :bind (("M-x" . helm-M-x)
                    :map evil-buffer-map
                    ("b" . switch-to-buffer)
                    :map evil-file-map
                    ("f" . find-file))
             :config
             (helm-mode 1))

(use-package helm-projectile
             :init
             (helm-projectile-on))

(use-package evil-org
             :after org
             :hook (org-mode . evil-org-mode)
             :config
             (require 'evil-org-agenda)
             (evil-org-agenda-set-keys)
             (evil-org-set-key-theme '(navigation insert textobjects additional calendar)))

(use-package org-superstar
             :after org
             :init
             (setq org-hide-leading-stars nil) ;; needed explicitly
             :hook (org-mode . org-superstar-mode)
             :config
             (setq org-superstar-remove-leading-stars t))

(use-package org-fancy-priorities
             :after org
             :hook (org-mode . org-fancy-priorities-mode)
             :config
	     (setq org-fancy-priorities-list '("↑" "←" "↓")))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

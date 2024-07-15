(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)

(package-initialize)

;; Bootstrap 'use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable 'use-package'
(eval-when-compile
  (require 'use-package))

(defalias 'yes-or-no-p 'y-or-n-p)

(setq inhibit-startup-screen t)

(menu-bar-mode -1)   ; Disable the menu bar
(setq ring-bell-function 'ignore)

;; Disable the creation of backup files
(setq make-backup-files nil)    ;; stop creating backup~ files
(setq auto-save-default nil)    ;; stop creating #autosave# files
(setq create-lockfiles nil)

(set-frame-parameter (selected-frame) 'alpha 0.85)

(setq display-line-numbers-type 'relative)

(global-display-line-numbers-mode)

(set-face-attribute 'default nil
		    :family "Hack Nerd Font"
		    :height 200)

(setq dired-listing-switches  "-agho --group-directories-first")

(electric-indent-mode +1)

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(add-hook 'term-mode-hook 'eterm-256color-mode)

;; Ensure all characters can be displayed
(use-package all-the-icons
  :ensure t)

(use-package emojify
  :ensure t
  :config
  (global-emojify-mode 1))


(load-theme 'manoj-dark t)

(custom-set-faces
 '(default ((t (:background "black"))))
 '(line-number ((t (:background "black"))))
 '(line-number-current-line ((t (:background "black")))))

;; ===== Org Mode ======
(use-package org
  :ensure t
  :config
  ;; enable word wrap
  (add-hook 'org-mode-hook #'turn-on-visual-line-mode)

  ;; org agenda configs
  (setq org-agenda-files '("~/.local/org" "~/Dropbox/org"))
  (setq org-todo-keywords
	'((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)" "CANCL(k!)"))))


;; ===== Snippets =====
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)


;; ===== Key Bindings =====
(defun open-emacs-config ()
  "Open your Emacs configuration file."
  (interactive)
  (find-file (expand-file-name "~/.emacs.d/config.org")))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Evil mode
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

;; Mapping Escape to jj
(use-package key-chord
  :ensure t
  :after evil
  :init
  (setq key-chord-two-keys-delay 0.4)
  :config
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state))

;; Evil Leader
(use-package evil-leader
  :ensure t
  :after evil
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>"))

;; Evil Collection
(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

;; Evil Commentary
(use-package evil-commentary
  :ensure t
  :after evil
  :config
  (evil-commentary-mode))

(use-package general
  :ensure t
  :config
  (general-create-definer leader-key-def :prefix "SPC")
  (leader-key-def
    :states '(normal dired-mode-map)
    :keymaps 'override

    "d" 'dired
    "f" 'find-file
    
    "e c" 'open-emacs-config
    
    "e t l" '(lambda ()
	       (interactive)
	       (find-file "~/.local/org/todo.org"))
    
    "e t d" '(lambda ()
	       (interactive)
	       (find-file "~/Dropbox/org/todo.org"))
    
    ;; orgmode keybindings
    "o l" 'org-store-link
    "o a" 'org-agenda
    "o c" 'org-capture
    
    ;; avy keybindings
    "SPC f" 'avy-goto-char
    "SPC F" 'avy-goto-char-2
    "SPC w" 'avy-goto-word-0
    "SPC W" 'avy-goto-word-1
    "SPC j" 'avy-goto-line
    "SPC k" 'avy-goto-line))


(use-package which-key
  :ensure t
  :config
  (which-key-setup-side-window-bottom)
  (which-key-mode))

(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode 1))

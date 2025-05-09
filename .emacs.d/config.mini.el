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

(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))   ; Disable the menu bar

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))   ; Disable the tool bar

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1)) ; Disable the scroll bar

(setq ring-bell-function 'ignore)

;; Disable the creation of backup files
(setq make-backup-files nil)    ;; stop creating backup~ files
(setq auto-save-default nil)    ;; stop creating #autosave# files
(setq create-lockfiles nil)

(setq display-line-numbers-type 'relative)

(global-display-line-numbers-mode)

(set-face-attribute 'default nil
      :family "Hack Nerd Font"
      :height 200)

(setq dired-listing-switches  "-agho --group-directories-first")

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(add-hook 'term-mode-hook 'eterm-256color-mode)

;; Ensure all characters can be displayed
(use-package all-the-icons
  :ensure t)

(use-package emojify
  :ensure t
  :config
  (global-emojify-mode 1))

(electric-indent-mode +1)

(load-theme 'manoj-dark t)

(custom-set-faces
  '(default ((t (:background "black"))))
  '(line-number ((t (:background "black"))))
  '(line-number-current-line ((t (:background "black")))))

(use-package org
  :ensure t
  :bind (("C-c l" . org-store-link)
	 ("C-c a" . org-agenda)
         ("C-c x" . org-toggle-checkbox)
	 ("C-c c" . org-capture))
  :config
  ;; enable word wrap
  (add-hook 'org-mode-hook #'turn-on-visual-line-mode)

  ;; org agenda configs
  (setq org-agenda-files '("~/.local/org" "~/xnotes/org" "~/Dropbox/org"))
  (setq org-todo-keywords
    '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)" "CANCL(k!)"))))

(use-package toc-org
  :ensure t
  :hook (org-mode . toc-org-enable))

(defun open-emacs-config ()
  "Open your Emacs configuration file."
  (interactive)
  (find-file (expand-file-name "~/.emacs.d/config.mini.org")))

(defun open-xnotes-todo ()
  "Open the Xnotes TODO file."
  (interactive)
  (find-file "~/xnotes/org/todo.org"))

(defun open-local-todo ()
  "Open the local TODO file."
  (interactive)
  (find-file "~/.local/org/todo.org"))

(defun open-local-notes ()
  "Open the local notes directory."
  (interactive)
  (dired "~/.local/org/"))

(defun open-xnotes ()
  "Open the Xnotes directory."
  (interactive)
  (dired "~/xnotes/"))

(defun open-dropbox-notes ()
  "Open the Dropbox notes directory."
  (interactive)
  (dired "~/Dropbox/org/"))

(defun push-xnotes-git ()
  "Stage all xnotes changes, commit with message 'Update Notes', and push to the remote repository."
  (interactive)
  (let ((default-directory "~/xnotes/"))
    (if (file-exists-p (expand-file-name ".git" default-directory)) ; Check if it's a Git repo
	(progn
	  (if (zerop (call-process "git" nil nil nil "add" ".")) ; Stage all changes
	      (if (zerop (call-process "git" nil nil nil "commit" "-m" "Update Notes")) ; Commit with message
		  (if (zerop (call-process "git" nil nil nil "push")) ; Push to remote
		      (message "Changes committed and pushed.")
		    (message "Git push failed."))
		(message "Git commit failed."))
	    (message "Git add failed."))
	  )
      (message "Not in a Git repository."))))

(defun pull-xnotes-git ()
  "Pull the latest changes from the remote Git repository."
  (interactive)
  (let ((default-directory "~/xnotes/"))
    (if (file-exists-p (expand-file-name ".git" default-directory)) ; Check if it's a Git repo
	(if (zerop (call-process "git" nil nil nil "pull")) ; Pull latest changes
	    (message "Successfully pulled the latest changes.")
	  (message "Git pull failed."))
      (message "Not in a Git repository."))))

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

    "h" 'windmove-left
    "j" 'windmove-down
    "k" 'windmove-up
    "l" 'windmove-right

    "d" 'dired
    "f" 'find-file

    "e c" 'open-emacs-config

    "g g" 'magit-status

    ;; notes
    "t" 'open-xnotes-todo
    "n t" 'open-local-todo
    "n l" 'open-local-notes
    "n x" 'open-xnotes
    "n p" 'pull-xnotes-git
    "n P" 'push-xnotes-git
    "n d" 'open-dropbox-notes

    ;; orgmode keybindings
    "TAB" 'org-cycle
    "o TAB" 'org-shifttab
    "o l" 'org-store-link
    "o a" 'org-agenda
    "o c" 'org-capture
    "o x" 'org-toggle-checkbox
    "o t" 'org-todo

    ;; avy keybindings
    "SPC f" 'avy-goto-char
    "SPC F" 'avy-goto-char-2
    "SPC w" 'avy-goto-word-0
    "SPC W" 'avy-goto-word-1
    "SPC j" 'avy-goto-line
    "SPC k" 'avy-goto-line))

(use-package magit
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-setup-side-window-bottom)
  (which-key-mode))

(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode 1))

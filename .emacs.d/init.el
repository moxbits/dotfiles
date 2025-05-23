;;; package --- emacs init config
;;; commentary:
;;; code:

(setq vc-follow-symlinks t)

(org-babel-load-file (expand-file-name "baseconf.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "orgmode.org" user-emacs-directory))
;; (org-babel-load-file (expand-file-name "coding.org" user-emacs-directory))

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(all-the-icons all-the-icons-dired all-the-icons-nerd-fonts
		   counsel-projectile emojify evil-collection
		   evil-commentary evil-leader general ivy-rich
		   key-chord magit smartparens spaceline toc-org)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "black"))))
 '(line-number ((t (:background "black"))))
 '(line-number-current-line ((t (:background "black")))))

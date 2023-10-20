;;; package --- emacs init config
;;; commentary:
;;; code:

(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f700bc979515153bef7a52ca46a62c0aa519950cc06d539df4f3d38828944a2c" "f7fe70ecf059f036813b327285e615438802980b8a477a3bbe4733aa0176c4fd" default))
 '(package-selected-packages
   '(toc-org web-mode sass-mode yaml-mode php-mode emmet-mode base16-theme help-find-org-mode doom-modeline format-all yasnippet-snippets yasnippet eterm-256color smartparens counsel-projectile general ivy-rich counsel nerd-icons-dired all-the-icons-nerd-fonts all-the-icons-ibuffer key-chord which-key vscode-dark-plus-theme rainbow-delimiters evil-leader)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "black"))))
 '(line-number ((t (:background "black"))))
 '(line-number-current-line ((t (:background "black")))))

;;; init.el ends here

(global-auto-revert-mode t)
(global-linum-mode t)

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;;signature
					    ("4yu" "shuang")
					    ))

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 15)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)
(provide 'init-better-defaults)

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

(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1)               ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) 

(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
(fset 'yes-or-no-p 'y-or-n-p)
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
(require 'dired-x')
(provide 'init-better-defaults)

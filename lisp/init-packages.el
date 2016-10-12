(require 'cl)
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

(defvar shuang/packages '(
			  company
			  monokai-theme
			  hungry-delete
			  swiper
			  counsel
			  smartparens
			  js2-mode
			  popwin
			  magit
			  ) "Default packages")
(setq package-selected-packages shuang/packages)

(defun shuang/packages-installed-p ()
  (loop for pkg in shuang/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))
(unless (shuang/packages-installed-p)
  (message "%s" "Refreshing package database ...")
  (package-refresh-contents)
  (dolist (pkg shuang/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


(global-hungry-delete-mode)
(smartparens-global-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;;javascript
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
(global-company-mode t)
(load-theme 'monokai t)

(require 'popwin)
(popwin-mode 1)

(provide 'init-packages)

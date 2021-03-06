(use-package gruvbox-theme
  :init
  (load-theme 'gruvbox-dark-soft t))

;(powerline-center-theme)
(require 'spaceline-config)
(require 'spaceline)
(spaceline-spacemacs-theme)

;(use-package spaceline :after powerline
;  :load-path "~/.emacs.d/spaceline"
;  :config (setq-default mode-line-format '("%e" (:eval (spaceline-ml-ati)))))

(use-package spaceline-all-the-icons :after spaceline 
  :load-path "~/.emacs.d/spaceline"
  :config (spaceline-all-the-icons-theme))


;(use-package spaceline-all-the-icons 
;  :after spaceline
;  :config (spaceline-all-the-icons-theme))


(load "all-the-icons-dired.el")
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)


(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
	sml/theme 'respectful)
  (sml/setup))


(use-package emacs
  :unless *is-windows*
  :config
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode t))


(defcustom centaur-prettify-symbols-alist
  '(("lambda" . ?λ)
    ("<-" . ?←)
    ("->" . ?→)
    ("->>" . ?↠)
    ("=>" . ?⇒)
    ("map" . ?↦)
    ("/=" . ?≠)
    ("!=" . ?≠)
    ("==" . ?≡)
    ("<=" . ?≤)
    (">=" . ?≥)
    ("=<<" . (?= (Br . Bl) ?≪))
    (">>=" . (?≫ (Br . Bl) ?=))
    ("<=<" . ?↢)
    (">=>" . ?↣)
    ("&&" . ?∧)
    ("||" . ?∨)
    ("not" . ?¬))
  "Alist of symbol prettifications."
  :group 'centaur
  :type '(alist :key-type string :value-type (choice character sexp)))

(provide 'init-ui)

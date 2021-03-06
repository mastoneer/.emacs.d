(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp"))
	      (expand-file-name (concat user-emacs-directory "spaceline"))
	      )
;(add-to-list 'load-path
;	     (expand-file-name (concat user-emacs-directory "spaceline")))


(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-const)
(require 'init-keyboard)
(require 'init-startup)
(require 'init-elpa)
(require 'init-package)
(require 'init-ui)
;(require 'init-modeline)
(require 'init-switch)
;(require 'init-cfgpkg)
(require 'init-config)
(require 'init-lang)



(when (file-exists-p custom-file)
  (load-file custom-file))


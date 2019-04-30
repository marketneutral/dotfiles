(require 'package)
(package-initialize)
(require 'elpy)
;;(require 'magit)
(require 'markdown-mode)

(add-to-list 'package-archives
	     '("melpa-stable"
	       . "https://stable.melpa.org/packages/"))

(blink-cursor-mode 0)
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(setq visible-bell t)
(setq global-linum-mode t)
(setq column-number-mode t)

(elpy-enable)
(setq elpy-rpc-backend "jedi")
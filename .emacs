;; TERM=xterm-256color

;; M-x package-refresh-contents
;; M-x package-install elpy ...

;; mkdir ~/.emacs.d
;; cd ~/.emacs.d
;; mkdir themes
;; cd themes
;; curl -L https://raw.githubusercontent.com/sjahl/emacs-theme-afterglow/master/afterglow-theme.el > afterglow-theme.el

;; in Jupyter terminal, there is an open bug with Xterm.js that cuases emacs to underline everything
;; The work around is after you do, say...
;; emacs test.py
;; do a C-x C-f [Enter] C-x b [Enter]
;; which forces a clear screen

(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("melpa-stable"
	       . "https://stable.melpa.org/packages/"))

(require 'elpy)
(require 'markdown-mode)

(blink-cursor-mode 0)
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(setq visible-bell t)
(setq global-linum-mode t)
(setq column-number-mode t)

(elpy-enable)
(setq elpy-rpc-backend "jedi")
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

(if (window-system)
    (progn
      (scroll-bar-mode -1)
      (tool-bar-mode -1)
      (set-face-attribute 'default nil :height 160)
      )
  )

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)
  )

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'afterglow t)

(global-set-key (kbd "C-h") 'delete-backward-char)

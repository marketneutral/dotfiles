;; TERM=xterm-256color   <-- should be in .bashrc

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

;; TODO: allow for conda environments
;; need environment variable in bashrc
;; WORKON_HOME=/home/{user}/.conda/envs   <-- we do this for --user conda envs
;; then add
;; (pyvenv-mode 1) to .emacs
;; After that, to choose environment, M-x pyvenv-workon

(require 'package)
(package-initialize)

;;(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
;;			 ("gnu" . "http://elpa.gnu.org/packages/")
;;			 ("marmalade" . "http://marmalade-repo.org/packages/")))

(add-to-list 'package-archives
	     '("melpa"
	       . "https://melpa.org/packages/") t)

(require 'elpy)
(require 'markdown-mode)
(require 'dockerfile-mode)

(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(blink-cursor-mode 0)
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(setq visible-bell t)
(setq global-linum-mode t)
(setq column-number-mode t)

;;(cua-mode t)
;;(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
;;(transient-mark-mode 1) ;; No region when it is not highlighted
;;(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

(remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)
(elpy-enable)
(setq elpy-rpc-backend "jedi")
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
(flymake-mode)  ;; Turns off Python linting!
(remove-hook 'elpy-modules 'elpy-module-flymake)

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
;;(load-theme 'afterglow t)
;;(load-theme 'clues t)
(load-theme 'zenburn t)
(require 'moe-theme)
;;(load-theme 'moe-dark t)
;;(load-theme 'atom-one-dark t)
(moe-theme-set-color 'orange)
(powerline-moe-theme)
;;(powerline-center-theme)
;;(load-theme 'zenburn t)
(setq powerline-arrow-shape 'slant)
(linum-mode)
(setq linum-format "%3d\u2502")

;; for ssh via Windows CMD, the backspace key doesn't work unless you add this
;;(global-set-key (kbd "C-h") 'delete-backward-char)

;; Steve Yegge! https://sites.google.com/site/steveyegge2/effective-emacs
;; This makes C-x C-m the Meta key (instead of Alt)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Set safe variable
(put 'docker-image-name 'safe-local-variable #'stringp)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zenburn-theme zen-mode solarized-theme powerline moe-theme markdown-mode elpy dockerfile-mode docker color-theme-sanityinc-solarized atom-one-dark-theme ample-zen-theme ample-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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

(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

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
(require 'moe-theme)
(load-theme 'moe-dark t)
(moe-theme-set-color 'magenta)
(powerline-moe-theme)
(setq powerline-arrow-shape 'slant)
(linum-mode)
(setq linum-format "%3d\u2502")

;; for ssh via Windows CMD, the backspace key doesn't work unless you add this
(global-set-key (kbd "C-h") 'delete-backward-char)

;; Steve Yegge! https://sites.google.com/site/steveyegge2/effective-emacs
;; This makes C-x C-m the Meta key (instead of Alt)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "b9a06c75084a7744b8a38cb48bc987de10d68f0317697ccbd894b2d0aca06d2b" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(elpy-rpc-python-command "python3")
 '(markdown-command "pandoc")
 '(package-selected-packages
   (quote
    (smart-mode-line-powerline-theme smart-mode-line company-anaconda powerline persistent-soft material-theme markdown-mode jedi ergoemacs-mode elpy anaconda-mode))))




;; this makes the auto split vertical
;;(setq split-height-threshold nil)
;;(setq split-width-threshold 0)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

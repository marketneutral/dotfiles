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
;;(load-theme 'solarized-dark t)
(require 'moe-theme)
(load-theme 'moe-dark t)
(moe-theme-set-color 'orange)
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
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#262626"))
 '(custom-safe-themes
   (quote
    ("26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "b9a06c75084a7744b8a38cb48bc987de10d68f0317697ccbd894b2d0aca06d2b" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(elpy-rpc-python-command "python3")
 '(fci-rule-color "#3a3a3a")
 '(hl-sexp-background-color "#121212")
 '(markdown-command "pandoc")
 '(package-selected-packages
   (quote
    (solarized-theme smart-mode-line-powerline-theme smart-mode-line company-anaconda powerline persistent-soft material-theme markdown-mode jedi ergoemacs-mode elpy anaconda-mode)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))




;; this makes the auto split vertical
;;(setq split-height-threshold nil)
;;(setq split-width-threshold 0)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

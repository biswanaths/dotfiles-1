(add-to-list 'load-path "~/.scripts") 
(add-to-list 'load-path "/usr/share/emacs/site-lisp/")                      
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files")
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby
in ruby-mode")

;; Adds some cool line numbers to the left ;;
(require 'linum)
(global-linum-mode 1)

;; Adds some cool auto complete.
(require 'auto-complete)
(global-auto-complete-mode t)

;; Setting some cool keyboard shortcuts ;;
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;; adds some cool language support ;;
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(require 'auto-complete-config)
(ac-config-default)
(setq indent-tabs-mode nil)
;; Turns syntax hylighting on ;;
(global-font-lock-mode 1)
; loads ruby mode
(autoload 'ruby-mode "ruby mode" "Major code for editing ruby scripts." t)
(setq auto-mode-alist  (cons '(".rb$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '(".rhtml$" . html-mode) auto-mode-alist))
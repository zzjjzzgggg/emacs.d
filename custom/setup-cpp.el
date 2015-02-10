(require 'cc-mode)
(require 'semantic)
(semantic-mode 1) ;; turn on semantic
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)

(defun my:semantic-hook()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))
(add-hook 'c-mode-common-hook 'my:semantic-hook)
(add-hook 'c-mode-hook 'my:semantic-hook)
(add-hook 'c++-mode-hook 'my:semantic-hook)

(require 'ede)
(global-ede-mode)

;; function-args
(require 'function-args)
(fa-config-default)
(define-key c-mode-map  [(tab)] 'moo-complete)
(define-key c++-mode-map  [(tab)] 'moo-complete)

;; company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(delete 'company-semantic company-backends)
(define-key c-mode-map  [(control tab)] 'company-complete)
(define-key c++-mode-map  [(control tab)] 'company-complete)

; company-c-headers
(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8/")
;
;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)


;; Available C style:
; “gnu”: The default style for GNU projects
; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
; “stroustrup”: What Stroustrup, the author of C++ used in his book
; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
; “linux”: What the Linux developers use for kernel development
; “python”: What Python developers use for extension modules
; “java”: The default style for java-mode (see below)
; “user”: When you want to define your own style

(setq c-default-style "linux") ;; set style to "linux"

; automatically indent when press RET
(global-set-key (kbd "RET") 'newline-and-indent)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                              (interactive)
                              (setq-local compilation-read-command nil)
                              (call-interactively 'compile)))

;; setup GDB
(setq
;; use gdb-many-windows by default
gdb-many-windows t
;; Non-nil means display source file containing the main routine at startup
gdb-show-main t
)

(provide 'setup-cpp)

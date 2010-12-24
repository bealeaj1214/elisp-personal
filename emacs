;;(global-set-key [f2] 'toggle-read-only)
(show-paren-mode '(1))

;; Personal Favorites
(global-set-key "\C-xl" 'goto-line)  ;; Set Goto line keystroke
(global-set-key [f2] 'toggle-read-only)
(global-set-key [f4] 'recompile)
(global-set-key [f8] 'revert-buffer)


(setq user-mail-address "alan.beale@chicagotrading.com")
(setq printer-name "uschi00lpr055")
(setq cscope-do-not-update-database t)
(setq ispell-program-name "/sw/bin/ispell")
(load-file "~/share/site-lisp/xcscope.el")
(require 'xcscope)
(load "/Users/alanbeale/elisp/ess-5.9.1/lisp/ess-site")

(ess-toggle-underscore nil)

(set-default 'compile-command "ant -s build/build.xml compile cscope")

(load-file "~/elisp/rpm-spec-mode.el")
(load-file "~/elisp/graphviz-dot-mode.el")

(load-file "~/elisp/merge-helper.el")
(load-file "~/elisp/maven-compile.el")
(load-file "~/elisp/setupJavaClass.el")


;;(add-to-list 'load-path "/Users/alanbeale/elisp/scala")
;;(require 'scala-mode-auto)
;;(load-file "~/share/site-lisp/cscope.el")
;;;;(require 'cscope)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; need to look up require
(require 'compile)

;; String pattern for locating errors in maven output. 
;;(add-to-list
;; 'compilation-error-regexp-alist
;; '("^\\(.*\\):\\[\\([0-9]+\\),\\([0-9]+\\)\\]" 1 2 3)) 

(add-to-list
 'compilation-error-regexp-alist
 '("^\\[ERROR\\] \\(.*\\):\\[\\([0-9]+\\),\\([0-9]+\\)\\]" 1 2 3)) 


(defun setup-scala-mode-support()
  "set up scala mode support"
  (add-to-list 'load-path "/Users/alanbeale/elisp/scala")
  (require 'scala-mode-auto)
)

(defun test-and-set-scala-mode-support()
  "test for existance of SCALA_HOME variable"
  (if (getenv "SCALA_HOME")
      (setup-scala-mode-support) )
)


(test-and-set-scala-mode-support)

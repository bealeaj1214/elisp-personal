
(defun base-setup-java-style-class(target-suffix)
  "create a java-style class skeleton for languages such as scala and groovy that follow java class skeletion idioms"
  (let     ((target-file-name (buffer-file-name nil))
	    (test-regexp1    (concat "\\(src/.+/" target-suffix "\\)/\\(.*\\)/\\([a-zA-Z][a-zA-Z0-9_]*\\)." target-suffix "$"))
	    (test-regexp2    (concat "\\(/src\\)/\\(.*\\)/\\([a-zA-Z][a-zA-Z0-9_]*\\)." target-suffix "$"))
	    )
    (if (string-match test-regexp1 target-file-name)
	(base-setup-java-style-class-match-help target-file-name  )
      
      (if (string-match test-regexp2 target-file-name)
	  (base-setup-java-style-class-match-help target-file-name  )
	(message "not match found")
	)
      )
))

(defun base-setup-java-style-class-match-help(target-file-name)
  "helper function to create class skelton"
  (let    ((target-package-path (match-string 2 target-file-name) )
	   (target-class-name (match-string 3 target-file-name) ) )
    (let ((target-package-name (replace-regexp-in-string "/" "." target-package-path nil nil nil)) 	
	  )
      (goto-char (point-min))
      (insert (format "package %s;\n\n\n\npublic class %s { \n\n\n\n}\n" 
		      
		      target-package-name target-class-name))
      )
    )      
)

(defun setup-groovy-class()
  "creates a groovy class skelton based on buffer-file name"
  (interactive "*")
  (base-setup-java-style-class "groovy" )
  )


(defun setup-java-class()
  "creates a java class skelton based on buffer-file name"
  (interactive "*")
  (base-setup-java-style-class "java" )
  )

(defun custom-java-mode-setup-hook()
  "java mode hook to call setup-java-class"
  (interactive "*")
  (if (= (point-min) (point-max))
      (setup-java-class))

)

(defun custom-groovy-mode-setup-hook()
  "groovy-mode hook to call setup-groovy-class"
  (interactive "*")
  (if (= (point-min) (point-max))
      (setup-groovy-class))

)

;;(add-hook 'java-mode-hook 'custom-java-mode-setup-hook)
;;(add-hook 'groovy-mode-hook 'custom-groovy-mode-setup-hook)

;; (defun show-buffer-file-name()
;;   "silly function to send buffer-file-name to message buffer"
;;   (interactive "*")
;;   (insert (buffer-file-name nil))
;; )

;; orginial nearly working code

;; (defun setup-java-class()
;;   "creates a java class skelton based on buffer-file name"
;;   (interactive "*")
;;   (let     ((target-file-name (buffer-file-name nil))
;; 	    (test-regexp    "\\(src/.+/java\\|/src\\)/\\(.*\\)/\\([a-zA-Z][a-zA-Z0-9_]*\\).java$")
;; 	    )

;;     ;;(message (regexp-quote "([A-Za-z][a-zA-Z0-9_]*).java$"))
;;     (if (string-match test-regexp target-file-name)
;; 	(let    ((target-package-path (match-string 2 target-file-name) )
;; 		 (target-class-name (match-string 3 target-file-name) ) )
;; 	  (let ((target-package-name (replace-regexp-in-string "/" "." target-package-path nil nil nil)) 	
;; 		)
;; 	    (goto-char (point-min))
;; 	    (insert (format "package %s;\n\n\n\npublic class %s { \n\n\n\n}\n" 
			     
;; 			     target-package-name target-class-name))
;; 	    ) 
;; 	)
	
;;       (message "not match found"))


;; ))


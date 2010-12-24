(defun setup-java-class()
  "creates a java class skelton based on buffer-file name"
  (interactive "*")
  (let     ((target-file-name (buffer-file-name nil))
	    (test-regexp    "\\(src/.+/java\\|/src\\)/\\(.*\\)/\\([a-zA-Z][a-zA-Z0-9_]*\\).java$")
	    )

    ;;(message (regexp-quote "([A-Za-z][a-zA-Z0-9_]*).java$"))
    (if (string-match test-regexp target-file-name)
	(let    ((target-package-path (match-string 2 target-file-name) )
		 (target-class-name (match-string 3 target-file-name) ) )
	  (let ((target-package-name (replace-regexp-in-string "/" "." target-package-path nil nil nil)) 	
		)
	    (goto-char (point-min))
	    (insert (format "package %s;\n\n\n\npublic class %s { \n\n\n\n}\n" 
			     
			     target-package-name target-class-name))
	    ) 
	)
	
      (message "not match found"))


))
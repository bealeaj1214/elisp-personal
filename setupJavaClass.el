(defun setup-java-class()
  "creates a java class skelton based on buffer-file name"
  (interactive "*")
  (let     ((target-file-name (buffer-file-name nil))
	    (test-regexp    "\\(src/.+/java\\|/src\\)/\\(.*\\)/\\([a-zA-Z][a-zA-Z0-9_]*\\).java$")
	    )

    ;;(message (regexp-quote "([A-Za-z][a-zA-Z0-9_]*).java$"))
    (if (string-match test-regexp target-file-name)
	(let    ((target-package-name (match-string 2 target-file-name) ))
	(message (format "found class %s  - package directory - %s" 
			 (match-string 3 target-file-name)
			 target-package-name ))
	)
	
      (message "not match found"))


))
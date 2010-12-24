(defun setup-java-class()
  "creates a java class skelton based on buffer-file name"
  (interactive "*")
  (let     ((target-file-name (buffer-file-name nil))
	    (test-regexp    ".java$")
	    )
    ;;(message "working on file %s " target-file-name))

    ;;(message (regexp-quote "([A-Za-z][a-zA-Z0-9_]*).java$"))
    (if (string-match test-regexp target-file-name)
	(message (format "found match in %s" target-file-name))
      (message "not match found"))


))
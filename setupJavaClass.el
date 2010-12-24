(defun setup-java-class()
  "creates a java class skelton based on buffer-file name"
  (interactive "*")
  (let     ((target-file-name (buffer-file-name nil)))
    (message "working on file %s " target-file-name))
)
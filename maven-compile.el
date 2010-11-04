
(require 'compile)

(defvar mvn-command-history nil
  "maven command history variable")

(defun mvn-compile(&optional args)
  "Runs maven in the current project. Starting in the directory of the current buffer visted resides, 
  a search is for the pom.xml recursively. A maven command is made from the first directory where a pom.xml file resides then the comand is displayed in the minibuffer.The command can be edited as needed and then executed. Errors are naigated to as ny other compile mode"
  (interactive)
  (let ((fn (buffer-file-name)))
    (let ((dir (file-name-directory fn)))
      (while (and (not (file-exists-p (concat dir "/pom.xml")))
		  (not (equal dir (file-truename (concat dir "/..")))))
	(setq dir (file-truename (concat dir "/.."))))
      (if (not (file-exists-p (concat dir "/pom.xml")))
	  (message "No pom.xml found")
	(compile (read-from-minibuffer "Command: "
				       (concat "mvn -f " dir "/pom.xml test") nil nil
				       'mvn-command-history))))))

 
(require 'compile)
;; inspired by ( stolen from ) http://walterh.posterous.com/maven-and-emacs
(defvar gradle-command-history nil
  "gradle command history variable")

(defun gradle-compile(&optional args)
  "Runs gradle in the current project. Starting in the directory of the current buffer visited resides, 
  a search is for the build.gradle recursively. A gradle command is made from the first directory where a build.gradle file resides then the command is displayed in the minibuffer.The command can be edited as needed and then executed. Errors are navigated to as any other compile mode"
  (interactive)
  (let ((fn (buffer-file-name)))
    (let ((dir (file-name-directory fn)))
      (while (and (not (file-exists-p (concat dir "/build.gradle")))
		  (not (equal dir (file-truename (concat dir "/..")))))
	(setq dir (file-truename (concat dir "/.."))))
      (if (not (file-exists-p (concat dir "/build.gradle")))
	  (message "No build.gradle found")
	(compile (read-from-minibuffer "Command: "
				       (concat "cd " dir " && gradle -q build") nil nil
				       'gradle-command-history))))))


;;  compilation-error-regexp for maven and gradle
;; external reference http://praveen.kumar.in/2011/03/09/making-gnu-emacs-detect-custom-error-messages-a-maven-example/

;;(add-to-list
;; 'compilation-error-regexp-alist
;; '("^\\[ERROR\\] \\(.*\\):\\[\\([0-9]+\\),\\([0-9]+\\)\\]" 1 2 3)) 

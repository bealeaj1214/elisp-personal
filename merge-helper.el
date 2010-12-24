

;; primitive git helper functions
(defun nuke-region-b()
  "Deletes region-b from merge result - git helper function."
  (interactive "*")
  (merge-helper-nuke-region "====" ">>>>")
)


;


(defun nuke-region-a()
  "Deletes region-a from merge result - git helper function."
  (interactive "*")
  (merge-helper-nuke-region "<<<<" "====")
)

(defun merge-helper-nuke-region (nuke-region-start nuke-region-end)
  "Deletes region from megre result need two parameters."
  
  (save-match-data
    (search-forward nuke-region-start)
    (move-beginning-of-line nil)
    (let ((start   (point)))
      (search-forward nuke-region-end)
      (move-end-of-line nil)
      (delete-region start (point))))
  nil)


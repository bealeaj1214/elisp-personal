

;; primitive git helper functions
(defun nuke-region-b()
  "Deletes region-b from merge result - git helper function."
  (interactive)
  (search-forward "====")
  (move-beginning-of-line nil)
  (let ((start   (point)))
    (search-forward ">>>>")
    (move-end-of-line nil)
    (delete-region start (point)))
  nil)


;


  (defun nuke-region-a()
  "Deletes region-a from merge result - git helper function."
  (interactive)
  (search-forward "<<<<")
  (move-beginning-of-line nil)
  (let ((start   (point)))
    (search-forward "====")
    (move-end-of-line nil)
    (delete-region start (point)))
  nil)

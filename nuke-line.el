(defun nuke-line-interactive(nuke-string)
  " find and delete all lines containing nuke-string "
  (interactive "*s enter string: ")
  ;;(message (format "you entered %s" nuke-string))
  (save-excursion
    (save-restriction 
      (save-match-data
	(widen) 
	(goto-char (point-min))
	(while (search-forward nuke-string nil t)
	  (beginning-of-line)
	  (let ((start  (point)))
	    (end-of-line)
	    (delete-region start (+ (point) 1))
	    ) ) ) ) )

)

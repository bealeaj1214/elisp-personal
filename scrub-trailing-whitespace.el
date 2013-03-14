(defun scrub-trailing-whitespace()
  "clean up trailing whitespace in file"
  (interactive)
  (save-excursion
    (save-restriction 
      (save-match-data
        (widen) 
        (goto-char (point-min))
        (while (search-forward-regexp "[ \t]+$" nil t)
          (end-of-line)
          (delete-horizontal-space())
          )
        )
      )
    )
)

(defun nuke-line-interactive(nuke-string)
  " find and delete all lines containing nuke-string "
  (interactive "*s enter string: ")
  (message (format "you entered %s" nuke-string))
)
(defun powerset (l)
  (if (null l)
      (list nil)
      (let ((prev (powerset (cdr l))))
	(append (mapcar #'(lambda (elt) (cons (car l) elt)) prev)
		prev))))

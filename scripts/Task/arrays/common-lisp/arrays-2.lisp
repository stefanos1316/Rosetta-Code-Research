(let ((array (make-array 0 :adjustable t :fill-pointer 0)))
  (vector-push-extend 1 array)
  (vector-push-extend 3 array)
  (setf (aref array 0) 2)
  (print array))

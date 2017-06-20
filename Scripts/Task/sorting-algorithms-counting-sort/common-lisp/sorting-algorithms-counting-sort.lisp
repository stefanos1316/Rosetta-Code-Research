(defun counting-sort (sequence &optional (min (reduce #'min sequence))
                                         (max (reduce #'max sequence)))
  (let ((i 0)
        (counts (make-array (1+ (- max min)) :initial-element 0
                                             :element-type `(integer 0 ,(length sequence)))))
    (declare (dynamic-extent counts))
    (map nil (lambda (n) (incf (aref counts (- n min)))) sequence)
    (map-into sequence (lambda ()
                         (do () ((plusp (aref counts i)))
                           (incf i))
                         (decf (aref counts i))
                         (+ i min)))))

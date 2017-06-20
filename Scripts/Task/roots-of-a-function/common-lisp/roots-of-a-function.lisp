(defun find-roots (function start end &optional (step 0.0001))
  (let* ((roots '())
         (value (funcall function start))
         (plusp (plusp value)))
    (when (zerop value)
      (format t "~&Root found at ~W." start))
    (do ((x (+ start step) (+ x step)))
        ((> x end) (nreverse roots))
      (setf value (funcall function x))
      (cond
       ((zerop value)
        (format t "~&Root found at ~w." x)
        (push x roots))
       ((not (eql plusp (plusp value)))
        (format t "~&Root found near ~w." x)
        (push (cons (- x step) x) roots)))
      (setf plusp (plusp value)))))

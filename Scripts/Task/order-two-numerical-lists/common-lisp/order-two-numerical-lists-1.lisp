(defun list< (a b)
  (cond ((not b) nil)
        ((not a) t)
        ((= (first a) (first b))
         (list< (rest a) (rest b)))
        (t (< (first a) (first b)))))

(do ((i 1 (1+ i))) ((> i 10))
  (format t "~a~:[, ~;~%~]" i (zerop (mod i 5))))

(do ((i 1 (1+ i))) ((> i 10))
  (write i)
  (when (zerop (mod i 5))
    (terpri)
    (go end))
  (write-string ", ")
  end)

(do ((i 1 (1+ i))) ((> i 10))
  (write i)
  (if (zerop (mod i 5))
    (terpri)
    (write-string ", ")))

(defun record (n)
  (with-open-file (in "/dev/dsp" :element-type '(unsigned-byte 8))
    (loop repeat n collect (read-byte in))
    )
  )
(defun play (byte-list)
  (with-open-file (out "/dev/dsp" :direction :output :element-type '(unsigned-byte 8) :if-exists :append)
    (mapcar (lambda (b) (write-byte b out)) byte-list)
    )
  )
(play (record 65536))

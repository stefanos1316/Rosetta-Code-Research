(let ((dlist (make-dlist)))
  (insert-head dlist 1)
  (insert-tail dlist 4)
  (insert-after dlist (dlist-head dlist) 2)
  (let* ((next-to-last (insert-before dlist (dlist-tail dlist) 3))
         (bad-link (insert-before dlist next-to-last 42)))
    (remove-link dlist bad-link))
  (print (dlist-elements dlist)))

(define nil '())

; remember append is applied to two lists
(define (reverse items)
  (if (null? items)
      items
      (append (reverse (cdr items)) (list (car items)))))

;(reverse '(1 2 3))
;(3 2 1)

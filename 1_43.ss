(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (lambda (x) 
    (if (< n 1)
        x
        ((compose f (repeated f (- n 1))) x))))

(define (square a) (* a a))

;((repeated square 2) 5)
;625

(define (compose f g)
  (lambda (x) (f (g x))))

(define (sq a) (* a a))

(define (inc a) (+ a 1))

;((compose sq inc) 6)
;49
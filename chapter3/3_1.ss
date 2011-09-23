(define (make-accumulator sum)
  (lambda (inc)
    (set! sum (+ sum inc))
    sum))

(define A (make-accumulator 5))

;(A 10)
;15
;(A 10)
;25

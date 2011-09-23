(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (square x) (* x x))

(define (inc a) (+ a 1))

;(sum square 2 inc 3)
;13
;(sum square 5 inc 4)
;0
;(sum square 4 inc 5)
;41
;(sum square 2 inc 4)
;29

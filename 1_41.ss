(define (double p) 
  (lambda (x) (p (p x))))

(define (inc a) (+ a 1))

;(((double (double double)) inc) 5) should be 
;(((double (lambda (x) (double (double x)))) inc 5)
;(((double (lambda (x) (double (lambda (y) (x (x y)))))) inc 5)
;(((double (lambda (x) (lambda (z) ((lambda (y) (x (x y))) ((lambda (y) (x (x y))) z)))) inc 5)
; if (lambda (z) ((lambda (y) (x (x y))) ((lambda (y) (x (x y))) z)) = t
;(((lambda (w) (t (t w)) inc 5)
;((t (t inc)) 5)
;((t (((lambda (y) (x (x y))) ((lambda (y) (x (x y))) inc) 5)
;((t (inc (inc 
;... finish it!

; Test
;(((double (double double)) inc) 5)
;21
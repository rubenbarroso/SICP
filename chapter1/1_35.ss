(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (golden-ratio guess)
  (fixed-point (lambda (y) (+ 1 (/ 1 y))) guess))

;(golden-ratio 5.0)
;1.618035882908404

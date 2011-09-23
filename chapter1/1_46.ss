(define (iterative-improve good-enough? improve-guess)
  (define (helper guess) 
    (let ((next-guess (improve-guess guess)))
      (if (good-enough? guess next-guess)
          next-guess
          (helper next-guess))))
  (lambda (init-guess) (helper init-guess)))

(define (close-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (define (good-enough? guess next-guess)
    (< (abs (- (square next-guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) x))

;(sqrt 9.0)
;3.00009155413138

;

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? guess next-guess)
    (< (abs (- guess next-guess)) tolerance))
  (define (improve guess)
    (f guess))
  ((iterative-improve close-enough? improve) first-guess))



(define tolerance 0.00001)

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess)
      (newline)
      (if (close-enough? guess next)
          guess
          (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (lambda (x) 
    (if (< n 1)
        x
        ((compose f (repeated f (- n 1))) x))))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (exp base exponent)
  (define (helper base exponent result)
    (if (= exponent 0)
        result
        (helper base (- exponent 1) (* base result))))
  (helper base exponent 1))

(define (floor-log2 n)
  (floor (/ (log n) (log 2))))

; t is number of required average-damps
(define (nth-root-helper x n t)
  (fixed-point (repeated (average-damp (lambda (y) (/ x (exp y (- n 1)))))
                         t) 
               1.0))

(define (nth-root x n)
  (nth-root-helper x n (floor-log2 n)))

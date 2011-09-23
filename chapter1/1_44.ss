(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (lambda (x) 
    (if (< n 1)
        x
        ((compose f (repeated f (- n 1))) x))))

(define dx 0.000001)

(define (average x y z) (/ (+ x y z) 3))

(define (smooth f)
  (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))))

(define (n-smooth f n)
  ((repeated smooth n) f)

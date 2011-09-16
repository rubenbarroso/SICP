; segments
(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

;points
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

;rectangles
; a rectangle may be defined with just 3 points 
; say p2 is the shared point between two sides
(define (make-rectangle short long)
  (cons short long))

(define (short-side r)
  (car r))

(define (long-side r)
  (cdr r))

(define (length s)
  (sqrt (+ (square (- (x-point (end-segment s)) (x-point (start-segment s))))
           (square (- (y-point (end-segment s)) (y-point (start-segment s)))))))

(define (perimeter r)
  (+ (* 2 (length (short-side r))) (* 2 (length (long-side r)))))

(define (area r)
  (* (length (short-side r)) (length (long-side r))))

(define rect1 (make-rectangle (make-segment (make-point 0 0) (make-point 0 5))
                              (make-segment (make-point 0 0) (make-point 10 0))))

;(area rect1)
;50.00023178323898

;(perimeter rect1)
;30.000046356787692

;helpers
(define (sqrt x)
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x))

(define (square x) (* x x))

(define (average a b) (/ (+ a b) 2))

                              
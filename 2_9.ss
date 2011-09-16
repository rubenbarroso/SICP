;helpers
(define (make-interval a b) (cons a b)) 

(define (upper-bound interval) (max (car interval) (cdr interval))) 

(define (lower-bound interval) (min (car interval) (cdr interval))) 

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

;(width (add-interval x y))
;
;(/ (- (upper-bound (add-interval x y)) 
;      (lower-bound (add-interval x y))) 
;   2)
;
;(/ (- (upper-bound (make-interval (+ (lower-bound x) (lower-bound y)) (+ (upper-bound x) (upper-bound y))))
;      (lower-bound (make-interval (+ (lower-bound x) (lower-bound y)) (+ (upper-bound x) (upper-bound y))))) 
;   2)
;
;(/ (- (+ (upper-bound x) (upper-bound y)) (+ (lower-bound x) (lower-bound y))) 2)
;
;(/ (+ (upper-bound x) (- (lower-bound x)) (upper-bound y) (- (lower-bound y))) 2)
;
; simple algebraic transformation: (a - b + c - d)/2 = (a - b)/2 + (c - d)/2
;(+ (/ (+ (upper-bound x) (- (lower-bound x))) 2)
;   (/ (+ (upper-bound y) (- (lower-bound y))) 2)
;
;(+ (/ (- (upper-bound x) (lower-bound x)) 2)
;   (/ (- (upper-bound y) (lower-bound y)) 2))
;
;(+ (width x) (width y))

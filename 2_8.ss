;helpers
(define (make-interval a b) (cons a b)) 

(define (upper-bound interval) (max (car interval) (cdr interval))) 

(define (lower-bound interval) (min (car interval) (cdr interval))) 

(define (add-interval x y) 
  (make-interval (+ (lower-bound x) (lower-bound y)) 
                 (+ (upper-bound x) (upper-bound y)))) 

(define (sub-interval x y)
  (add-interval x 
                (make-interval (- (upper-bound y)) 
                               (- (lower-bound y)))))

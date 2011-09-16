;helpers
(define (make-interval a b) (cons a b)) 

(define (upper-bound interval) (max (car interval) (cdr interval))) 

(define (lower-bound interval) (min (car interval) (cdr interval))) 

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (make-center-percent c p)
  (let ((width (/ (* c p) 100)))
    (make-interval (- c width) (+ c width))))

(define (percent i)
  (let ((c (center i)))
    (* (/ (- (upper-bound i) c) c) 100)))

;(make-center-percent 10 50)
;(5 . 15)
;(percent (make-interval 5 15))
;50
;(percent (make-interval 0 60))
;100
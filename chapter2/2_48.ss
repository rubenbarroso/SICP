;helpers
(define (make-vect xcor ycor)
  (cons xcor ycor))

(define (xcor-vect v)
  (car xcor))

(define (ycor-vect v)
  (cdr ycor))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
             (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v))
             (* s (ycor-vect v))))

;exercise
(define (make-segment start end)
  (cond start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

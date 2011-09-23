;helpers

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (caddr frame))

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

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

;a
(define sides (list (make-segment (make-vect 0 0) (make-vect 0 1)) ;left
                    (make-segment (make-vect 0 0) (make-vect 1 0)) ;bottom
                    (make-segment (make-vect 0 1) (make-vect 1 1)) ;top
                    (make-segment (make-vect 1 0) (make-vect 1 1)))) ;right

(define (outline frame)
  (segments->painter sides) frame)

;b
(define diagonal1 (make-segment (make-vect 0 0) (make-vect 1 1)))

(define diagonal2 (make-segment (make-vect 0 1) (make-vect 1 0)))

(define (connect frame)
  (segments->painter (list diagonal1 diagonal2)) frame)

;c
(define diamond-side1 (make-segment (make-vect 0 0.5) (make-vect 0.5 1)))

(define diamond-side2 (make-segment (make-vect 0.5 1) (make-vect 1 0.5)))

(define diamond-side3 (make-segment (make-vect 1 0.5) (make-vect 0.5 0)))

(define diamond-side4 (make-segment (make-vect 0.5 0) (make-vect 0 0.5)))

(define (diamond frame)
  ((segments->painter (list diamond-side1 diamond-side2 diamond-side3 diamond-side4)) frame))

;d
;not done since it's only a matter of providing a list of segments that draw the image

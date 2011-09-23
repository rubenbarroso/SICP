(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (caddr frame))

;obviously, these should not be numbers, but for testing purposes, it does not matter
;(edge2-frame (make-frame 1 2 3))
;3
;(edge1-frame (make-frame 1 2 3))
;2
;(origin-frame (make-frame 1 2 3))
;1

(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame2 frame)
  (car frame))

(define (edge1-frame2 frame)
  (cadr frame))

(define (edge2-frame2 frame)
  (cddr frame))

;same as above
;(origin-frame2 (make-frame2 1 2 3))
;1
;(edge1-frame2 (make-frame2 1 2 3))
;2
;(edge2-frame2 (make-frame2 1 2 3))
;3

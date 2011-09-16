(define (make-queue)
  (let ((front-ptr nil)
        (rear-ptr nil))
    (define (set-fptr! item) 
      (set! front-ptr item))
    (define (set-rptr! item) 
      (set! rear-ptr item))
    (define (dispatch m)
      (cond ((eq? m 'front-ptr) front-ptr)
            ((eq? m 'rear-ptr) rear-ptr)
            ((eq? m 'set-front-ptr!) set-fptr!)
            ((eq? m 'set-rear-ptr!) set-rptr!)
            (else (error "Unefined operation -- MAKE-QUEUE" m))))
    dispatch))

(define (front-ptr queue)
  (queue 'front-ptr))

(define (rear-ptr queue)
  (queue 'rear-ptr))

(define (set-front-ptr! queue item)
  ((queue 'set-front-ptr!) item))

(define (set-rear-ptr! queue item)
  ((queue 'set-rear-ptr!) item))

;the upper abstraction layer (empty-queue?, front-queue, ...) can be defined in 
;terms of the previous operations and as such, they needn't change

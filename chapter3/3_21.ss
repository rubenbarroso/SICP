(define (front-ptr queue) (car queue))

(define (rear-ptr queue) (cdr queue))

(define (set-front-ptr! queue item) (set-car! queue item))

(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (empty-queue? queue) (null? (front-ptr queue)))

(define (make-queue) (cons '() '()))

(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front-ptr queue))))

(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
          (else
           (set-cdr! (rear-ptr queue) new-pair)
           (set-rear-ptr! queue new-pair)
           queue)))) 

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (error "DELETE! called with an empty queue" queue))
        (else
         (set-front-ptr! queue (cdr (front-ptr queue)))
         queue))) 

;exercise
(define q1 (make-queue))

(insert-queue! q1 'a)
;((a) a)

(insert-queue! q1 'b)
;((a b) b)

(delete-queue! q1)
;((b) b)

(delete-queue! q1)
;(() b)

(define (print-queue queue)
  (define (print-helper list)
    (if (null? list)
        (display ")")
        (begin
          (display (car list))
          (if (null? (cdr list))
              (display "")
              (display " "))
          (print-helper (cdr list)))))
  (display "(")
  (if (empty-queue? queue)
      (print-helper nil)
      (print-helper (front-ptr queue))))

;(define q2 (make-queue))
;(print-queue q2)
;()
;(insert-queue! q2 'a)
;(print-queue q2)
;(a)
;(insert-queue! q2 'b)
;(print-queue q2)
;(a b)

;that was too much work :/
;display can be used also to print out lists
(define (print-queue2 q)
  (newline)
  (display (car q)))

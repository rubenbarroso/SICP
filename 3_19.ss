;helpers
(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

; we need to use the 'Tortoise and Hare' algorithm (aka Floyd-Warshall)
;http://en.wikipedia.org/wiki/Cycle_detection

(define (has-cycles? x)
  (define (next t)
    (if (pair? t)
        (cdr t)
        nil))
  (define (iter tortoise hare)
    (cond ((null? hare) false) ;no cycles
          ((eq? tortoise hare) true) ;the hare reached the tortoise
          (else (iter (next tortoise) (next (next hare))))))
  (iter x (next x)))

(define z (make-cycle (list 'a 'b 'c)))

;(has-cycles? z)
;#t

;(has-cycles? nil)
;#f

;(has-cycles? (list 'a 'b 'c))
;#f

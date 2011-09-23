(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (has-cycles? x)
  (let ((visited nil))
    (define (helper x)
      (cond ((not (pair? x)) false)
            ((memq x visited) true)
            (else
             (set! visited (cons x visited))
             (or (helper (car x))
                 (helper (cdr x))))))
    (helper x)))

(define z (make-cycle (list 'a 'b 'c)))

;(has-cycles? z)
;#t

;(has-cycles? nil)
;#f

;(has-cycles? (list 'a 'b 'c))
;#f

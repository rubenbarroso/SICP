(define (count-pairs x)
  (let ((visited nil))
    (define (helper x)
      (cond ((not (pair? x)) 0)
            ((memq x visited) 0)
            (else
             (set! visited (cons x visited))
             (+ (helper (car x))
                (helper (cdr x))
                1))))
    (helper x)))

(define r3 '(a b c))

;r3
;(a b c)
;(count-pairs r3)
;3

; non returning
(define p (cons (cons '1 '2) (cons '3 '4)))
(set-cdr! (cdr p) p)

;(count-pairs p) - should loop forever
;3

(define p1 (cons 'a 'b))

(define p2 (cons p1 p1))

(define r7 (cons p2 p2))

;r7
;(((a . b) a . b) (a . b) a . b)
;(count-pairs r7) - it returned 7
;3

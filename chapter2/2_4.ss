(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

;(car (cons 1 3))
;1

(define (cdr z)
  (z (lambda (p q) q)))

;(cdr (cons 1 2))
;2

;verification
;(car (cons a b))
;((cons a b) (lambda (p q) p))
;((lambda (m) (m a b)) (lambda (p q) p))
;((lambda (p q) p) a b)
;a

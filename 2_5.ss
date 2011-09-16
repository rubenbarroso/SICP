;helpers
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (square x) (* x x))

(define (cons a b)
  (* (fast-expt 2 a) (fast-expt 3 b)))

(define (car z)
  (number-divs 2 z))

(define (cdr z)
  (number-divs 3 z))

(define (number-divs b n)
  (define (helper k i)
    (if (= (remainder k b) 0)
        (helper (/ k b) (+ i 1))
        i))
  (helper n 0))

;(car (cons 3 4))
;3
;(cdr (cons 3 4))
;4

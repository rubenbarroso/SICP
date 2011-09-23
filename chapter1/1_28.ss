; copied from http://wiki.drewhess.com/wiki/SICP_exercise_1.28
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (check-nontrivial-sqrt (expmod base (/ exp 2) m) m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (check-nontrivial-sqrt n m)
  (let ((x (remainder (square n) m)))
    (if (and (= x 1)
             (not (= n 1)) 
             (not (= (- m 1) n)))
        0
        x)))

(define (miller-rabin-test n a)
  (= (expmod a (- n 1) n) 1))

(define (prime? n)
  (cond ((= n 2) #t)
        ((even? n) #f)
        (else
         (prime-helper n (- n 1)))))

(define (prime-helper n a)
  (cond ((= a 0) #t)
        ((miller-rabin-test n a) (miller-rabin-test n (- a 1)))
        (else #f)))

(define (square x) (* x x))

;(prime? 1729)
;#f
;(prime? 6601)
;#f
;(prime? 2465)
;#f
;(prime? 7)
;#t
;(prime? 43)
;#t

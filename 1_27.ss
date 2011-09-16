(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square n) (* n n))

(define (prime? n)
  (define (try-it a)
    (= (expmod a n n) a))
  (define (iter-try-it a n)
    (cond ((= a n) true)
          ((try-it a) (iter-try-it (+ a 1) n))
          (else false)))
  (iter-try-it 1 n))
          
;(prime? 561)
;#t
;(prime? 1105)
;#t
;(prime? 1729)
;#t
;(prime? 2465)
;#t
;(prime? 2821)
;#t
;(prime? 6601)
;#t        

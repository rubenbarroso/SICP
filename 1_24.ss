
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (square n) (* n n))

(define (divides? a b)
  (= (remainder b a) 0))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 2)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; Exercise 1.22
(define (search-for-primes current upper)
  (cond ((divides? 2 current) (search-for-primes (+ 1 current) upper))
        ((<= current upper) (timed-prime-test current) (search-for-primes (+ 2 current) upper))))

; Results
;(search-for-primes 1001 1100)
;1009 *** 36
;1013 *** 31
;1019 *** 32

; we would expect a ratio of (lg 10e6 / lg 10e3) = 6/3 = 2

;(search-for-primes 1000001 1000500)
;1000003 *** 96 (ratio 96/36 = 2.66)
;1000033 *** 83 (ratio 83/32 = 2.59)
;1000037 *** 84 (ratio 84/32 = 2.62)
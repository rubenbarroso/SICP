(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (next n)
  (if (= n 2) 
      3
      (+ n 2)))

(define (square n) (* n n))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
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
;1009 *** 25
;1013 *** 25
;1019 *** 26

;1009 *** 19 (ratio 25/19 = 1.31)
;1013 *** 19 (ratio 25/19 = 1.31)
;1019 *** 19 (ratio 26/19 = 1.36)

;(search-for-primes 10001 10100)
;10007 *** 923
;10009 *** 70
;10037 *** 68

;10007 *** 47 (ratio 923/47 = 19.63)
;10009 *** 60 (ratio 70/60 = 1.16)
;10037 *** 45 (ratio 68/45 = 1.51)

;(search-for-primes 100001 100500)
;100003 *** 218
;100019 *** 266
;100043 *** 202

;100003 *** 141 (ratio 218/141 = 1.54)
;100019 *** 132 (ratio 266/132 = 2.01)
;100043 *** 137 (ratio 202/137 = 1.47)

;(search-for-primes 1000001 1000500)
;1000003 *** 669
;1000033 *** 648
;1000037 *** 610

;1000003 *** 407 (ratio 669/407 = 1.64)
;1000033 *** 395 (ratio 648/395 = 1.64)
;1000037 *** 394 (ratio 669/407 = 1.64)
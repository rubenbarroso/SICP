(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value    
      (combiner (if (filter a) null-value (term a))
                (filtered-accumulate filter combiner null-value term (next a) next b))))

(define (inc n) (+ n 1))

(define (identity x) x)

(define (sum-even term a next b)
  (define (combine-sum m n) (+ m n))
  (filtered-accumulate odd? combine-sum 0 identity a inc b))

;(sum-even identity 1 inc 7) ;2 + 4 + 6 = 12
;12
;(sum-even identity 10 inc 19) ;10 + 12 + 14 + 16 + 18 = 70
;70

;a
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (square n) (* n n))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (sum-prime-squares a b)
  (define (not-prime? n) (not (prime? n))) 
  (define (combine-sum m n) (+ m n))
  (filtered-accumulate not-prime? combine-sum 0 square a inc b))

;(sum-prime-squares 1 8) ;1^2 + 2^2 + 3^2 + 5^2 + 7^2 = 1 + 9 + 25 + 49 = 88
;88

;b
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (product-gcd n)
  (define (relative-prime m) (not (= (gcd m n) 1)) )
  (define (combine-product m n) (* m n))
  (filtered-accumulate relative-prime combine-product 1 identity 1 inc n))

;(product-gcd 5) ;2*3*4 = 24
;24
;(product-gcd 8) ;3*5*7 = 105
;105

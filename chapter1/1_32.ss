; a
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (inc n) (+ n 1))

(define (identity x) x)

(define (acc-sum term a next b)
  (define (combine-sum m n) (+ m n))
  (accumulate combine-sum 0 identity a inc b))

;(acc-sum identity 5 inc 7)
;18
;(acc-sum identity 10 inc 15)
;75

(define (acc-product term a next b)
  (define (combine-product m n) (* m n))
  (accumulate combine-product 1 identity a inc b))

;(acc-product identity 3 inc 5)
;60
;(acc-product identity 4 inc 7)
;840

; b
(define (iter-accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (iter-acc-sum term a next b)
  (define (combine-sum m n) (+ m n))
  (iter-accumulate combine-sum 0 identity a inc b))

;(iter-acc-sum identity 5 inc 7)
;18
;(iter-acc-sum identity 10 inc 15)
;75

(define (iter-acc-product term a next b)
  (define (combine-product m n) (* m n))
  (iter-accumulate combine-product 1 identity a inc b))

;(iter-acc-product identity 3 inc 5)
;60
;(iter-acc-product identity 4 inc 7)
;840
;helpers
(define nil '())

(define (reverse items)
  (if (null? items)
      items
      (append (reverse (cdr items)) (cons (car items) nil))))

;exercise
(define us-coins (list 50 25 10 5 1))

(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define (no-more? coin-values)
  (null? coin-values))

(define (except-first-denomination coin-values)
  (cdr coin-values))

(define (first-denomination coin-values)
  (car coin-values))

;(cc 100 us-coins)
;292
;(cc 100 (reverse us-coins))
;292

;the order of coin-values does not affect the result
;because it does not matter the order in which we
;extract the values of the coins
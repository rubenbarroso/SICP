(load "text/ch4-ambeval.scm")

(define the-global-environment (setup-environment))

;see changes in ch4-ambeval.scm

;paste the following after doing (driver-loop)
(define (require p)
  (if (not p) (amb)))

(define (an-element-of items)
  (require (not (null? items)))
  (amb (car items) (an-element-of (cdr items))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (square x) (* x x))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (prime-sum-pair list1 list2)
  (let ((a (an-element-of list1))
        (b (an-element-of list2)))
    (require (prime? (+ a b)))
    (list a b)))

(let ((pairs '()))
  (if-fail (let ((p (prime-sum-pair '(1 3 5 8) '(20 35 110))))
             (permanent-set! pairs (cons p pairs))
             (amb))
           pairs))

;;;; Starting a new problem 
;;; Amb-Eval value:
;((8 35) (3 110) (3 20))

;;; Amb-Eval input:
;try-again

;;; There are no more values of
;(let ((pairs '())) (if-fail (let ((p (prime-sum-pair '(1 3 5 8) '(20 35 110)))) (permanent-set! pairs (cons p pairs)) (amb)) pairs))

;this expression returns all the pairs of values from the two lists whose sum is a prime number


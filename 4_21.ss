((lambda (n)
   ((lambda (fact)
      (fact fact n))
    (lambda (ft k)
      (if (= k 1)
          1
          (* k (ft ft (- k 1)))))))
 10)

;a
;Value: 3628800

(define (fact n)
  (if (= n 1)
      1
      (* n (fact (- n 1)))))

;(fact 10)
;3628800

((lambda (n)
   ((lambda (fib)
      (fib fib n))
    (lambda (fb k)
      (cond ((= k 0) 0)
            ((= k 1) 1)
            (else (+ (fb fb (- k 1))
                     (fb fb (- k 2))))))))
 8)

;Value: 21

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))
;(fib 8)
;21

;b
(define (f x)
  ((lambda (even? odd?)
     (even? even? odd? x))
   (lambda (ev? od? n)
     (if (= n 0) true (od? ev? od? (- n 1))))
   (lambda (ev? od? n)
     (if (= n 0) false (ev? ev? od? (- n 1))))))

;(f 5)
;#f
;(f 6)
;#t
;(f 0)
;#t
;(f 1)
;#f

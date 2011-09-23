(load "text/ch4-mceval.scm")

(define test1 '(quote test))

(define env (setup-environment))

(eval
 '(define (factorial n)
    (if (= n 1)
        1
        (* (factorial (- n 1)) n)))
 env)
 
(eval
 '(define (timed-test test times) 
   (newline)
   (start-test (runtime) test times))
 env)
 
(eval 
 '(define (start-test start-time test times) 
   (if (= times 0) 
       (report-prime (- (runtime) start-time))
       (begin
         test
         (start-test start-time test (- times 1)))))
 env)
 
(eval 
 '(define (report-prime elapsed-time) 
   (display " *** ") 
   (display elapsed-time))
 env)
 
(eval '(timed-test (lambda () (factorial 2500)) 50000) env)

;execution 1: *** 2898851
;execution 2: *** 2902737
;execution 3: *** 2799500

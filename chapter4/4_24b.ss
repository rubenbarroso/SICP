(load "text/ch4-analyzingmceval.scm")

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

;execution 1: *** 1565895
;execution 2: *** 1493468
;execution 3: *** 1597215

;Approximate results

;ORIGINAL_EVALUATOR    ANALYZING_EVALUATOR   OVERHEAD
;------------------    -------------------   ----------
;2898851               1565895               1332956 (46%)
;2902737               1493468               1409269 (48%)
;2799500               1597215               1202285 (43%)

;as we see, there is an overhead of ~47% imposed by the extra analysis of the original metacircular evaluator


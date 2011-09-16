;helpers taken from http://wqzhang.wordpress.com/2009/07/11/sicp-exercise-3-6/
(define (rand-update x)
  (let ((a (expt 2 32))
        (c 1103515245)
        (m 12345))
    (modulo (+ (* a x) c) m)))

(define random-init 137)

;exercise 3.6
(define rand
  (let ((x random-init))
    (lambda (op)
      (cond ((eq? 'generate op)
             (set! x (rand-update x))
             x)
            ((eq? 'reset op)
             (lambda (new-value)
               (set! x new-value)
               (display "rand initialized")))
            (else (error "Operation not found -- RAND" op))))))

;(rand 'generate)
;3062
;(rand 'generate)
;1397
;((rand 'reset) 3062)
;rand initialized
;(rand 'generate)
;1397
;(rand 'unknown)
;Operation not found -- RAND unknown



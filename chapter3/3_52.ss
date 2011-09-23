(define sum 0)
(define (accum x)
  (set! sum (+ x sum))
  sum)
(define seq (stream-map accum (stream-enumerate-interval 1 20)))
(define y (stream-filter even? seq))
(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq))
(stream-ref y 7)
(display-stream z)

;sum is 20(20+1)/2 = 210 because the stream is consumed entirely
;the evaluation of stream-ref prints out:
; 10
; 15
; 45
; 55
; 105
; 120
; 190
; 210
;The responses would not differ because the memoization only affects the perfomance of the operation when the stream-cdr is forced

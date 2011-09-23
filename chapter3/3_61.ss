(load "3_60.ss")

(define (invert-unit-series series)
  (cons-stream 1
               (scale-stream (mul-series (stream-cdr series)
                                         (invert-unit-series series))
                             -1)))

(define one (mul-series cosine-series
                        (invert-unit-series cosine-series)))

;(stream-ref one 0)
;1
;(stream-ref one 1)
;0
;(stream-ref one 2)
;0

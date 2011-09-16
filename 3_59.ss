(load "3_55.ss")

;a
(define (integrate-series stream)
  (define (integrate-series-helper s factor)
    (cons-stream (/ (stream-car s) factor)
                 (integrate-series-helper (stream-cdr s) (+ factor 1))))
  (integrate-series-helper stream 1))

;Weiqun Zhang describes a higher-level version. Concise.
(define (integrate-series s)
  (stream-map / s integers))

;b
(define exp-series
  (cons-stream 1 (integrate-series exp-series)))

(define cosine-series
  (cons-stream 1 (scale-stream (integrate-series sine-series)
                               -1)))

(define sine-series
  (cons-stream 0 (integrate-series cosine-series)))

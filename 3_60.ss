(load "3_59.ss")

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (scale-stream s f)
  (stream-map (lambda (x) (* x f)) s))

(define (mul-series s1 s2)
  (cons-stream (* (stream-car s1) (stream-car s2))
               (add-streams (scale-stream (stream-cdr s2) (stream-car s1))
                            (mul-series (stream-cdr s1) s2))))

(define one (add-streams (mul-series cosine-series cosine-series)
                         (mul-series sine-series sine-series)))

;(stream-ref one 0)
;1
;(stream-ref one 1)
;0
;(stream-ref one 2)
;0
;(stream-ref one 3)
;0

(define (integral integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (add-streams (scale-stream integrand dt)
                              int)))
  int)

(define (RC R C dt)
  (lambda (i v0)
    (define v
      (add-streams (integral (scale-stream i (/ 1.0 C)) v0 dt)
                   (scale-stream i R)))
    v))

(define RC1 (RC 5 1 0.5))

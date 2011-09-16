(define (RLC R L C dt)
  (lambda (vc0 il0)
    (cons (vc-stream vc0 C dt)
          (il-stream il0 R L dt))))

(define (vc-stream vc0 C dt)
  (define vc (integral (delay dvc) vc0 dt))
  (define dvc (scale-stream (delay il-stream) (/ -1.0 C)))
  vc)

(define (il-stream il0 R L dt)
  (define il (integral (delay dil) il0 dt))
  (define dil (add-streams (scale-stream vc-stream (/ 1.0 L))
                           (scale-stream il (* (- R) (/ 1.0 L)))))
  il)
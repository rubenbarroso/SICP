;we will remove the bindings in the first frame of the environment
;if the user needs to remove it from the enclosing environments,
;she should traverse the environment hierarchy by herself
(define (make-unbound! var env)
  (define (scan vars vals)
    (cond ((null? vars)
           (error "Unbound variable -- MAKE-UNBOUND!" var))
          ((eq? var (car vars))
           (set-car! vars nil) ; deleted bindings are marked with the empty list
           (set-car! vals nil))
          (else (scan (cdr vars) (cdr vals)))))
  (let ((frame (first-frame env)))
    (scan (frame-variables frame)
          (frame-values frame))))

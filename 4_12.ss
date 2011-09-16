(define (scan-environment var env process null-process)
  (define (scan-frame vars vals)
    (cond ((null? vars) (null-process env))
          ((eq? var (car vars)) (process vals))
          (else (scan-frame (cdr vars) (cdr vals)))))
  (if (eq? env the-empty-environment)
      (error "Empty environment")
      (let ((frame (first-frame env)))
        (scan (frame-variables frame)
              (frame-values frame)))))

(define (lookup-variable-value var env)
  (define (null-process env)
    (scan-environment var (enclosing-environment env) car null-process))
  (scan-environment var env car null-process))

(define (set-variable-value! var val env)
  (define process (lambda (vals) (set-car! vals val)))
  (define (null-process env)
    (scan-environment var (enclosing-environment env) process null-process))
  (scan-environment var env process null-process))

(define (define-variable! var val env)
  (define process (lambda (vals) (set-car! vals val)))
  (define (null-process env)
    (add-binding-to-frame! var val (first-frame env)))
  (scan-environment var env process null-process))
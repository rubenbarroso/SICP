;a
(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var (car vars))
             (if (eq? (car vals) '*unassigned*)
                 (error "Unassigned variable -- LOOKUP-VARIABLE-VALUE" var)
                 (car vals))
             (car vals))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))

;b
(define (extract-definitions body)
  (define (iter body definitions)
    (cond ((null? body) definitions)
          ((definition? (car body))
           (iter (cdr body) (cons (car body) definitions)))
          (else (iter (cdr body) definitions))))
  (iter body nil))

(define (extract-body-expression body)
  (cond ((definition? (car body))
         (extract-body-expression (cdr body)))
        (else (car body))))

(define (scan-out-defines body)
  (let ((definitions (extract-definitions body))
        (body-expression (extract-body-expression body)))
    (cons
     (append (list 'let 
                   (map (lambda (def) (list (definition-variable def) 
                                            '*unassigned*)) 
                        definitions))
             (map (lambda (def) (list 'set! 
                                      (definition-variable def) 
                                      (definition-value def))) 
                  definitions))
     extract-body-expression)))

;c
(define (make-procedure parameters body env)
  (list 'procedure parameters (scan-out-defines body) env))

;I'd say installing scan-out-defines in make-procedure is more
;efficient that doing that in procedure-body since it is calld
;only once

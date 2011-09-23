;In exercise 4.16b we implemented scan-out-defines
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

;we now only need to use it with the lambda's body
(define (compile-lambda-body exp proc-entry ct-env)
  (let ((formals (lambda-parameters exp)))
    (append-instruction-sequences
      (make-instruction-sequence '(env proc argl) '(env)
        `(,proc-entry
          (assign env (op compiled-procedure-env) (reg proc))
          (assign env
                  (op extend-environment)
                  (const ,formals)
                  (reg argl)
                  (reg env))))
      (compile-sequence
        (scan-out-defines (lambda-body exp)) 'val 'return (extend-cenv formals cenv)))))


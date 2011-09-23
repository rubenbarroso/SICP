(define (delayed? operand)
  (and (pair? operand)
       (or (eq? (cadr operand) 'lazy)
           (eq? (cadr operand) 'lazy-memo))))

(define (delayed-memo? operand)
  (and (delayed? operand)
       (eq? operand 'lazy-memo)))

(define (delay-it-memo exp env)
  (list 'thunk-memo exp env))

(define (thunk-memo? obj)
  (tagged-list? obj 'thunk-memo))

(define (list-of-args exps env)
  (cond ((no-operands? exps) nil)
        ((delayed? (first-operand exps))
         (cons (delay-it (first-operand exps) env)
               (list-of-args (rest-operands exps))))
        ((delayed-memo? (first-operand exps))
         (cons (delay-it-memo (first-operand exps) env)
               (list-of-args (rest-operands exps))))
        (else (cons (actual-value (first-operand exps) env)
                    (list-of-args (rest-operands exps))))))

(define (force-it obj)
  (cond ((thunk-memo? obj)
         (let ((result (actual-value
                        (thunk-exp obj)
                        (thunk-env obj))))
           (set-car! obj 'evaluated-thunk)
           (set-car! (cdr obj) result)
           (set-cdr! (cdr obj) '())
           result))
        ((thunk? obj)
         (actual-value (thunk-exp obj) (thunk-env obj)))
        ((evaluated-thunk? obj)
         (thunk-value obj))
        (else obj)))

(define (procedure-parameters p) ;changed
  (map (lambda (param)
         (if (pair? param)
             (car param)
             param))
       p))

(define (apply procedure arguments env)
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure
          procedure
          (list-of-arg-values arguments env)))
        ((compound-procedure? procedure)
         (eval-sequence
          (procedure-body procedure)
          (extend-environment
           (procedure-parameters procedure)
           (list-of-args arguments env)           ;changed procedure
           (procedure-environment procedure))))
        (else
         (error
          "Unknown procedure type - APPLY" procedure))))
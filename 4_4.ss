;and
(define (and-parameters exp) (cdr exp))

(define (eval-and exps env)
  (if (no-operands? exps)
      true
      (let ((first-value (eval (first-operand exps) env)))
        (if (true? first-value)
            (eval-and (rest-operands exps) env)
            false))))

;or
(define (or-parameters exp) (cdr exp))

(define (eval-or exps env)
  (if (no-operands? exps)
      false
      (let ((first-value (eval (first-operand exps) env)))
        (if (true? first-value)
            true
            (eval-or (rest-operands exps) env)))))

;within install-eval-package
(put 'eval 'and
     (lambda (exp env) (eval-and (and-parameters exp) env)))

(put 'eval 'or
     (lambda (exp env) (eval-or (or-parameters exp) env)))

;as derived expressions
(define (and->if exp)
  (expand-clauses (and-parameters)))

(define (expand-and-clauses clauses)
  (if (null? clauses)
      'true
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (make-if (make-not first)
                 'false
                 (expand-and-clauses rest)))))

(define (or->if exp)
  (expand-clauses (or-parameters)))

(define (expand-or-clauses clauses)
  (if (null? clauses)
      'false
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (make-if  first
                 'true
                 (expand-or-clauses rest)))))

(define (make-not exp)
  (list 'not exp))

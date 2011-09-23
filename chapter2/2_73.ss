(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp)) (operands exp)
                                           var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;a
;the procedure get will retrieve the operation corresponding to the operator of the expression and will combine this with the expression operands.
;number? and same-variable? cannot be assimilated because there is nothing to dispatch through them. They're just predicates, not operators

;b
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

;other needed procedures not here

(define (install-deriv-package)
  (define (derive-sum exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))
  (define (derive-product exp var)
    (make-sum 
     (make-product (multiplier exp)
                   (deriv (multiplicand exp) var))
     (make-product (deriv (multiplier exp) var)
                   (multiplicand exp))))
  (put 'deriv '+ deriv-sum)
  (put 'deriv '* deriv-product)
  'done)

;c
;inside install-deriv-package
(define (derive-exponentiation exp var)
  (make-product (exponent exp)
                (make-product (make-exponentiation (base exp) (make-sum n -1))
                              (deriv (base exp) var))))
(put 'deriv '** deriv-exponentiation)

;d
;we only need to switch the operands of the put procedures
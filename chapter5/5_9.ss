;we can't modify make-primitive-exp because it is not only used for the input of make-operation-exp, but for assignments to registers (make-assign).
(define (make-primitive-exp exp machine labels)
  (cond ((constant-exp? exp)
         (let ((c (constant-exp-value exp)))
           (lambda () c)))
        ;removed case for labels - but this would break make-assign, not allowing assigning a label to a register
        ((register-exp? exp)
         (let ((r (get-register machine
                                (register-exp-reg exp))))
           (lambda () (get-contents r))))
        (else
         (error "Unknown expression type - ASSEMBLE" exp))))

;instead, we can change make-operation-exp itself to deal with labels:
(define (make-operation-exp exp machine labels operations)
  (let ((operands (operation-exp-operands exp)))
    (check-operands operands) ;this will catch the errors at assembly time
    (let ((op (lookup-prim (operation-exp-op exp) operations))
          (aprocs
           (map (lambda (e)
                  (make-primitive-exp e machine labels))
                operands)))
      (lambda ()
        (apply op (map (lambda (p) (p)) aprocs))))))

(define (check-operands operands)
  (for-each (lambda (operand)
              (if (label-exp? operand) 
                  (error "labels not permitted as arguments to make-operation-exp: " operand)))
            operands))

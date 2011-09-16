;we need to change the code we implemented in exercise 5.38
(define (open-coded? exp cenv)
  (and (or (tagged-list? exp '+)
           (tagged-list? exp '-)
           (tagged-list? exp '*)
           (tagged-list? exp '/))
       (eq? (find-variable (operator exp) cenv) 'not-found))) ;if it is not in any environemnt, then it is treated as a procedure application

(define (compile-open-coded exp target linkage)
  (spread-arguments (car exp) (cadr exp) (caddr exp) target linkage))

(define (spread-arguments operator operand1 operand2 target linkage cenv) ;added compile-environment parameter
  (let ((c-operand1 (compile operand1 'arg1 'next cenv))
        (c-operand2 (compile operand2 'arg2 'next cenv)))
    (end-with-linkage 
     linkage
     (append-instruction-sequences
      c-operand1
      (preserving 
       '(arg1)
       c-operand2
       (make-instruction-sequence
        '(arg1 arg2)
        (list target)
        `((assign ,target (op ,operator) (reg arg1) (reg arg2)))))))))
;a
;since application? uses pair? to classify the operation, 
;reordering the cond clauses in eval will not work cause
;the assignments will be treated as procedure applications.
;(definition x 3) will be classified as a procedure application
;and will be evaluated as such, and that won't work since
;definition is not a procedure.

;b
(define (application? exp) (tagged-list? exp 'call))

(define (operator exp) (cadr exp))

(define (operands exp) (cddr exp))

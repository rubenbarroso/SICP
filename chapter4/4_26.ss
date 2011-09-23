;if unless is implemented as a special form, then it will be treated as a special case by the metacircular evaluator
;OTOH, if it is implemented as procedure, it can be passed as an argument to another procedure

;unless as a derived expression
(define (unless? exp) (tagged-list? exp 'unless))

(define (unless-condition exp) (car exp))

(define (unless-exceptional-value exp) (cadr exp))

(define (unless-usual-value exp) (caddr exp))

(define (unless->if exp)
  (make-if (unless-condition exp)
           (unless-exceptional-value exp)
           (unless-usual-value exp)))

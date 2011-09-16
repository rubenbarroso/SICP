;let's change only a new syntax for conditionals
;(if <predicate> then <consequent> else <alternative>)

(define (if? exp)
  (and (tagged-list? exp 'if)
       (tagged-list? (cddr exp) 'then)
       (tagged-list? (cddddr exp) 'else)))

(define (if-predicate exp) (cadr exp))

(define (if-consequent exp) (cadddr exp))

(define (if-alternative exp)
  (if (not (null? (cddddr exp)))
      (cadddddr exp) ; this selector might not exist, but you get the idea ...
      'false))

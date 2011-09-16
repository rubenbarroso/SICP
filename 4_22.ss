(define (let-variables exp)
  (map car (cadr exp)))

(define (let-exps exp)
  (map cadr (cadr exp)))

(define (let-body exp) (cddr exp))

(define (let->combination exp)
  (cons (make-lambda (let-variables exp) (let-body exp))
  (let-exps)))

(define (let? exp) (tagged-list? exp 'let))

;clause in eval
((let? exp) (eval (let->combination exp) env))

;extension of the new evaluator
(define (analyze-let exp)
  (analyze (let->combination exp)))

(define (let*-exps exp) (cadr exp))

(define (let*-body exp) (caddr exp))

(define (make-let let-exps body)
  (list 'let let-exps body))

(define (let*->nested-lets exp)
  (expand-let* (let*-exps exp) (let*-body exp)))

(define (expand-let* let-exps let-body)
  (if (null? let-exps)
      let-body
      (make-let (list (car let-exps))
                (expand-let* (cdr let-exps) let-body))))

(define (let*? exp) (tagged-list? exp 'let*))

;it is sufficient to add (eval (let*->nested-lets exp) env)


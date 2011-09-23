(define (make-frame variables values)
  (map list variables values))

;(make-frame '(a b c d) '(1 2 3 4))
;((a 1) (b 2) (c 3) (d 4))

(define (frame-variables frame)
  (map car frame))

;(frame-variables (make-frame '(a b c d) '(1 2 3 4)))
;(a b c d)

(define (frame-values frame)
  (map cadr frame))

;(frame-values (make-frame '(a b c d) '(1 2 3 4)))
;(1 2 3 4)

;extend-environment, lookup-variable-value should not change
;for set-variable-value!, the use of set-car! is an abstraction leak

(define (set-variable-value! var val env)
  (define (iter bindings)
    (cond ((null? bindings) 
           (set-variable-value! var val (enclosing-environment env)))
          ((eq? var (caar bindings)) 
           (set-cdr! (car bindings) (cons val nil)))
          (else (iter (cdr bindings)))))
  (if (eq? env the-empty-environment)
      (error "Unbound variable -- SET!" var)
      (iter (first-frame env))))

           
(define (set-variable-value! var val env)
  
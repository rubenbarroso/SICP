;a
;(letrec ((a 1)
;         (b 2))
;  (+ a b))

;transformed into
;(let ((a '*unassigned*)
;      (b '*unassigned*))
;  (set! a 1)
;  (set! b 2)
;  (+ a b))

(define (letrec-exps exp) (cadr exp))

(define (letrec-body exp) (cddr exp))

(define (letrec-vars->vars exps)
  (map (lambda (exp) (list (car exp) '*unassigned*)) exps))

(define (letrec-body->body exps body)
  (append 
   (map (lambda (exp) (list 'set! (car exp) (cadr exp))) exps)
   (list body)))

(define (make-let let-exps body)
  (list 'let let-exps body))

(define (letrec->let exp)
  (make-let (letrec-vars->vars (letrec-exps exp))
            (letrec-body->body (letrec-exps exp) (letrec-body body))))

(define (letrec? exp) (tagged-list? exp 'letrec))

;b
(letrec ((even?
          (lambda (n)
            (if (= n 0)
                true
                (odd? (- n 1)))))
         (odd?
          (lambda (n)
            (if (= n 0)
                false
                (even? (- n 1))))))
  <rest of body of f>)

;Louis transforms the previous code into:

((lambda (even? odd?) 
   <rest of body of f>)
 (lambda (n)
   (if (= n 0)
       true
       (odd? (- n 1))))
 (lambda (n)
   (if (= n 0)
       false
       (even? (- n 1)))))

;This is not equivalent to the original form expressed with letrec, because the body of the lambda for even? has not access to the lambda for odd?, and conversely.


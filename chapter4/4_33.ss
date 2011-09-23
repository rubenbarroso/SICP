;in eval
((quoted? exp) (eval-quoted exp env))

;new eval sub-procedures
(define (make-lazy-list mylist)
  (if (null? mylist)
      nil
      (list 'cons 
            (car mylist) 
            (make-lazy-list (cdr mylist)))))

(define (eval-quoted exp env)
  (if (pair? (text-of-quotation exp))
      (eval (make-lazy-list (text-of-quotation exp)) env)
      (text-of-quotation exp)))

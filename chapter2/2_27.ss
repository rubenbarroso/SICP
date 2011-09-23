(define (reverse items)
  (if (null? items)
      items
      (append (reverse (cdr items)) 
              (cons (car items) nil))))

(define x (list (list 1 2) (list 3 4)))

(define (deep-reverse items)
  (if (null? items)
      items
      (append (deep-reverse (cdr items))
              (if (pair? (car items))
                  (list (deep-reverse (car items)))
                  (cons (car items) nil)))))

;(deep-reverse x)
;((4 3) (2 1))
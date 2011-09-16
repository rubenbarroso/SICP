(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items nil))

(define (square x) (* x x))

;(square-list (list 1 2 3))
;(iter (list 1 2 3) nil)
;(iter (list 2 3) (cons 1 nil))
;(iter (list 3) (cons 4 (cons 1 nil)))
;(iter nil (cons 9 (cons 4 (cons 1 nil))))
;(9 4 1)

(define (square-list-rep items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

;(square-list (list 1 2 3))
;(iter (list 1 2 3) nil)
;(iter (list 2 3) (cons nil 1))
;(iter (list 3) (cons (cons nil 1) 4))
;(iter nil (cons (cons (cons nil 1) 4) 9))
;(((() . 1) . 4) . 9)
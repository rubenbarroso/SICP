(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (x) 
                     (if (not (pair? x))
                         1
                         (count-leaves x))) 
                   t)))

;(count-leaves (list 1 2 (list 3 4)))
;4
;(count-leaves (list 1 2 (list 3 4 (list 5 6 7)) 5))
;8
;(count-leaves (list (list (list 2) 3 (list 4 5)) (list (list 1) (list 5))))
;6
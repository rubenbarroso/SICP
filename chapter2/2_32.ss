;expand (subsets (list 1 2 3))
;(append (subsets (list 2 3)) (map ?? (subsets (list 2 3))))
;
;(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

;expand (subsets (list 2 3))
;(append (subsets (list 3)) (map ?? (subsets (list 3))))
;
;(() (3) (2) (2 3))

;expand (subsets (list 3))
;(append (subsets nil) (map ?? (subsets nil)))
;(append (list nil) (map ?? (list nil)))
;
;(() (3))


(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest 
                (map (lambda (x) (cons (car s) x)) 
                          rest)))))

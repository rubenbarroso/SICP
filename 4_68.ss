(load "query.ss")

(define data-base 
  '(
    (rule (append-to-form () ?y ?y))
    
    (rule (append-to-form (?u . ?v) ?y (?u . ?z))
          (append-to-form ?v ?y ?z))
    
    (rule (reverse () ()))
    
    (rule (reverse (?u . ?v) ?z)
          (and (reverse ?v ?w)
               (append-to-form ?w (?u) ?z)))
    ))

(initialize-data-base data-base)

;;; Query input:
;(reverse (1 2 3) ?x)

;;; Query results:
;(reverse (1 2 3) (3 2 1))

;;; Query input:
;(reverse ?x (1 2 3))
;infinite loop
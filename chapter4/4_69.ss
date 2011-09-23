(load "query.ss")

(define data-base
  '(
    ;assertions
    (son Adam Cain)
    (son Cain Enoch)
    (son Enoch Irad)
    (son Irad Mehujael)
    (son Mehujael Methushael)
    (son Methushael Lamech)
    (wife Lamech Ada)
    (son Ada Jabal)
    (son Ada Jubal)
    
    ;rules
    (rule (grandson ?G ?S)
          (and (son ?F ?S)
               (son ?G ?F)))
    
    (rule (son ?M ?S)
          (and (wife ?M ?W)
               (son ?W ?S)))
    
    (rule (last-grandson (grandson)))
    
    (rule (last-grandson (?u . ?v))
          (last-grandson ?v))
    
    (rule ((grandson) ?x ?y)
          (grandson ?x ?y))
    
    (rule ((great . ?rel) ?x ?y)
          (and (last-grandson ?rel)
               (son ?x ?f)
               (?rel ?f ?y)))
    ))

(initialize-data-base data-base)

;;; Query input:
;((great grandson) ?g ?ggs)

;;; Query results:
;((great grandson) Mehujael Jubal)
;((great grandson) Irad Lamech)
;((great grandson) Mehujael Jabal)
;((great grandson) Enoch Methushael)
;((great grandson) Cain Mehujael)
;((great grandson) Adam Irad)

;;; Query input:
;((great great grandson) ?g ?ggs)

;;; Query results:
;((great great grandson) Irad Jubal)
;((great great grandson) Enoch Lamech)
;((great great grandson) Irad Jabal)
;((great great grandson) Cain Methushael)
;((great great grandson) Adam Mehujael)

;;; Query input:
;((great great great great great grandson) Adam ?x)

;;; Query results:
;((great great great great great grandson) Adam Jubal)
;((great great great great great grandson) Adam Jabal)

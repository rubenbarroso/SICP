(load "query.ss")

;paste the following in the query-driver-loop (qdl)

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
))

(initialize-data-base data-base)

;;; Query input:
;(grandson Cain ?x)

;;; Query results:
;(grandson Cain Irad)

;;; Query input:
;(son Lamech ?x)

;;; Query results:
;(son Lamech Jubal)
;(son Lamech Jabal)

;;; Query input:
;(grandson Methushael ?x)

;;; Query results:
;(grandson Methushael Jubal)
;(grandson Methushael Jabal)


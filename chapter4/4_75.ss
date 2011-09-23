(load "query.ss")

(initialize-data-base microshaft-data-base)

;look for string "exercise 4.75" in query.ss to find the solution to this exercise

;supervisor of exactly one subordinate

;;; Query input:
;(and (supervisor ?who ?s)
;  (unique (supervisor ?other ?s)))

;;; Query results:
;(and (supervisor (Cratchet Robert) (Scrooge Eben)) (unique (supervisor (Cratchet Robert) (Scrooge Eben))))
;(and (supervisor (Reasoner Louis) (Hacker Alyssa P)) (unique (supervisor (Reasoner Louis) (Hacker Alyssa P))))

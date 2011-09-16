;see the steps in the yellow pad (omnigraffle diagram)
(rule (last-pair (?x) (?x)))

(rule (last-pair (?v . ?z) (?x))
      (last-pair ?z (?x)))

;;; Query input:
(last-pair (3) ?x)
;;; Query results:
(last-pair (3) (3))

;;; Query input:
(last-pair (1 2 3) ?x)
;;; Query results:
(last-pair (1 2 3) (3))

;;; Query input:
(last-pair (2 ?x) (3))
;;; Query results:
(last-pair (2 3) (3))

;;; Query input:
(last-pair (3) ?x)
;;; Query results:
;infinite loop

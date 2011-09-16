(load "query_4_76.ss")

(initialize-data-base microshaft-data-base)

;see definition of conjoin in query_4_76.ss

;;; Query input:
;(and (job ?person (computer programmer))
;     (address ?person ?where))

;;; Query results:
;(and (job (Fect Cy D) (computer programmer)) (address (Fect Cy D) (Cambridge (Ames Street) 3)))
;(and (job (Hacker Alyssa P) (computer programmer)) (address (Hacker Alyssa P) (Cambridge (Mass Ave) 78)))

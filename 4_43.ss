(load "text/ch4-ambeval.scm")

(define the-global-environment (setup-environment))

;This is rather easy to solve manually. From the exercise description we can infer all the yacht ownerships:
; (Downing Melissa)
; (Hall Rosalind)
; (Moore Lorna)
; (Barnacle Gabrielle)
; (Parker MaryAnn)  <--- by exclusion
;
;We know two of the daughters:
; (Moore MaryAnn)
; (Barnacle Melissa)
;
;We can infer the following possibilities:
; (Downing Lorna) or (Downing Rosalind) or (Downing Gabrielle)
; (Hall Lorna) or (Hall Gabrielle)
; (Parker Rosalind) or (Parker Lorna) or (Parker Gabrielle)
;
;"Gabrielle's father owns the yacht that is named after Dr. Parker's daughter"
;This eliminates this possibility: (Parker Gabrielle)
;That leaves two possible fathers for Gabrielle: Downing and Hall. If it were Downing, then since Downing's yacht is Melissa, Parker's daughter would have
;to be Melissa, but Melissa is already Barnacle's daughter. Therefore, we eliminate Downing and that leaves Hall as the father of Gabrielle.
;In turn, since Hall's yacht is Rosalind, Parker's daughter must be Rosalind. These leaves Downing as the solely father of Lorna. 
;
;The final picture:
;
;Colonel Downing's daughter is Lorna
;Mr. Hall's daughter is Gabrielle
;Mr. Moore's daughter is Mary Ann
;Sir Barnacle Hood's daughter is Melissa
;Dr. Parker's daughter is Rosalind

;now, let's see the potential solutions if we don't know that Mr. Moore's daughter is Mary Ann.

;paste the following after doing (driver-loop)
(define (require p)
  (if (not p) (amb)))

(define (distinct? items)
  (cond ((null? items) true)
        ((null? (cdr items)) true)
        ((member (car items) (cdr items)) false)
        (else (distinct? (cdr items)))))

(define (daughters)
  (let ((melissa-father 'Barnacle)
        (maryann-father (amb 'Downing 'Hall 'Moore 'Parker))
        (gabrielle-father (amb 'Downing 'Hall 'Moore 'Parker))
        (lorna-father (amb 'Downing 'Hall 'Parker))
        (rosalind-father (amb 'Downing 'Moore 'Parker)))
    (require (cond ((eq? gabrielle-father 'Moore) (eq? lorna-father 'Parker))
                   ((eq? gabrielle-father 'Hall) (eq? rosalind-father 'Parker))
                   (else false)))
    (require (distinct? (list melissa-father rosalind-father maryann-father lorna-father gabrielle-father)))
    (let ((links (list (list maryann-father 'MaryAnn)
                       (list melissa-father 'Melissa)
                       (list lorna-father 'Lorna)
                       (list gabrielle-father 'Gabrielle)
                       (list rosalind-father 'Rosalind))))
      links)))

(daughters)

;;;; Amb-Eval input:

;;; Starting a new problem 
;;; Amb-Eval value:
;((Hall MaryAnn) (Barnacle Melissa) (Parker Lorna) (Moore Gabrielle) (Downing Rosalind))

;;; Amb-Eval input:
;try-again

;;; Amb-Eval value:
;((Moore MaryAnn) (Barnacle Melissa) (Downing Lorna) (Hall Gabrielle) (Parker Rosalind))

;;; Amb-Eval input:
;try-again

;;; There are no more values of
;(daughters)

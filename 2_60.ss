;element-of-set? same for repeated representation
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

;adjoin-set
(define (adjoin-set x set) 
  (cons x set))

;union-set
(define (union-set set1 set2)
  (append set1 set2))
 
;element-of-set? still O(n) - cannot be improved
;adjoin-set is now O(1)
;union-set cannot be improved
;intersection-set cannot be improved

;I'd use this representation for bags, in order to know the number of times an element has been inserted into a set
;From the wiki: "We would probably only want to use this representation for applications in which adjoin-set is a 
;frequent operation, compared to the other procedures, and in which the size of our sets is not an issue."

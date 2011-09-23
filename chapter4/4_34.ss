(define (user-print object)
  (cond ((compound-procedure? object)
         (display (list 'compound-procedure
                        (procedure-parameters object)
                        (procedure-body object)
                        '<procedure-env>)))
        ((lazy-list-procedure? object)
         (display (lazy-list-procedure->list object default-count)))
        (else
         (display object))))

;lazy-list-procedure->list returns a list with the default-count elements of the input list and '... as its last element,
;representing infinite lists

;eval-dispatch
eval-dispatch
  (test (op cond?) (reg exp))
  (branch (label ev-cond))
  
;ev-cond
;we use two additional registers: clauses and first-clause. Alternatively, we could have been used just unev and apply special operations to extract the first and the rest of the clauses stored in it 
ev-cond
  (assign clauses (op cond-clauses) (reg exp))
ev-cond-loop
  (assign first-clause (op first-clause) (reg clauses))
  (test (op else-clause?) (reg first-clause))
  (branch (label ev-clause-consequent))
  (save exp)
  (save env)
  (save continue)
  (assign continue (label ev-clause-decide))
  (assign exp (op clause-predicate) (reg first-clause))
  (goto (label eval-dispatch))
ev-clause-decide
  (restore continue)
  (restore env)
  (restore exp)
  (test (op true?) (reg val))
  (branch (label ev-clause-consequent))
  (assign clauses (op rest-clauses) (reg clauses))
  (goto (label ev-cond-loop))
ev-clause-consequent
  (assign unev (op clause-consequent) (reg first-clause))
  (save continue)
  (goto (label ev-sequence))
  
  
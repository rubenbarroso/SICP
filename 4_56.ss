;a
(and (supervisor ?name (Bitdiddle Ben))
     (address ?name ?street))

;b
(and (salary ?person ?amount)
     (salary (Bitddidle Ben) ?ben-amount)
     (lisp-value < ?amount ?ben-amount))

;c
(and (supervisor ?name ?supervisor-name)
     (not (job ?supervisor-name (computer . ?type)))
     (job ?supervisor-name ?job))

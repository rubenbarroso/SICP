;expression to analyze
;(quote Jack)

;Alyssa's version calls execute-sequence at runtime, as it is the body of the outer lambda expression
(analyze-sequence ((quote Jack)))
(lambda (env) (execute-sequence ((lambda (env) 'Jack)) env))

;Text's version is more efficient
(analyze-sequence ((quote Jack)))
(lambda (env) 'Jack)

;with two expressions (proc# is the result of analyzing the exp#)
;Alyssa's
(analyze-sequence (exp1 exp2))
(lambda (env) (execute-sequence (proc1 proc2) env))

;Text's
(analyze-sequence (exp1 exp2))
(lambda (env) (proc1 env) (proc2 env))

;There is an extra frame because the let expression is equivalent to a lambda expression, which is evaluates in a newly-created environment.
;Since this is a lambda inside another lambda, there is no difference with the original.

;For simultaneous scoping, we can move all the definitions to the top. Since the body of the lambdas are not evaluted until the procedure is
;applied, we can intermix definitions of procedures and calls to those procedures safely.



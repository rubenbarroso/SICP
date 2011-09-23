;since map is a primitive procedure in Louis's version,
;it is applied using:
;
;(apply-in-underlying-scheme (primitive-implementation) args)
;
;which is evaluated as
;
;(apply map args)
;
;this is clearly wrong because the procedure that map accepts is
;the first in the args list, and it is now a tagged list, no
;matter its nature (if it was a primitive, it would be tagged
;with 'primitive)


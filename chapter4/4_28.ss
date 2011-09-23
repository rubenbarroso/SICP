(define (process proc input)
  (proc input))

(define (doubler input)
  (* input 2))

;the following fails because process is not a primitive procedure, and as such its double argument is not forced
;(process doubler 4)

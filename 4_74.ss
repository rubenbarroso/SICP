;a
(define (simple-stream-flatmap proc s)
  (simple-flatten (stream-map proc s)))

(define (simple-flatten stream)
  (stream-map stream-car
              (stream-filter 
               (lambda (frame) (not (stream-null? frame)))
               stream)))

;b
;This doesn't affect the behavior of the query system because using interleaving, the empty streams
;do not help match any assertion nor rule, hence they are effectively ignored, ending up with the 
;same result as using simple-stream-flatmap.

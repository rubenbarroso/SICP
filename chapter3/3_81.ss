(define (rand random-stream)
  (define (random-numbers initial-value)
    (cons-stream initial-value
                 (stream-map rand-update random-numbers)))
  (define (dispatch op)
    (cond ((eq? op 'generate) (random-numbers random-init))
          ((eq? op 'reset) 
           (lambda (new-value)
             (random-numbers (stream-car (stream-filter (lambda (n) (= n new-value)) (random-numbers random-init))))))
           (else (error "Operation not found -- RAND" op))))
  dispatch)

; not sure if this works. Cannot test without rand-update

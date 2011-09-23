(define x 10)

(define s (make-serializer))

(parallel-execute (lambda () (set! x ((s (lambda () (* x x))))))
                  (s (lambda () (set! x (+ x 1)))))

;101 : same
;121 : same
;100 : P1 accesses x twice, P2 sets x to 11, and P1 sets x to 100

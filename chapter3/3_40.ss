(define x 10)

(parallel-execute (lambda () (set! x (* x x)))
                  (lambda () (set! x (* x x x))))

;10^6 : P1 sets x to 100, P2 reads and sets x to 10^6
;    or P2 sets x to 1000, P1 reads and sets x to 10^6
;10^5 : P2 reads x (10), P1 sets x to 10^2, P2 reads x twice and sets x (10^5)
;10^4 : P1 reads x (10), P2 sets x to 10^3, P1 reads x again (10^3) and sets x to 10^4
;    or P2 reads x (10) twice, P1 sets x to 10^2, P2 reads and sets x (10^4)
;10^3 : P2 reads x (10) thrice (10^3), P1 reads x twice and sets x (10^2), P2 sets x (10^3)
;10^2 : P1 reads x twice (10^2), P2 reads and sets x (10^3), P1 sets x (10^2)

;with serialized procedures, we have now full serialization, then the only possible value is 10^6

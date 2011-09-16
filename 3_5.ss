;Monte Carlo integration
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (let ((area (* (abs (- x2 x1)) (abs (- y2 y1))))
        (test (lambda () (P (random-in-range (min x1 x2) (max x1 x2))
                            (random-in-range (min y1 y2) (max y1 y2))))))
    (* area 
       (monte-carlo trials test))))

;approximate pi
;circle centered at (0,0)
(define (test-in-circle x y)
  (<= (+ (square x) (square y) 1)))

;(estimate-integral test-in-circle -1 1 -1 1 8)
;4
;sadly, random does not accept inexact integers, hence the approximation is not very useful :(

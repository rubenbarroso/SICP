(define (estimate-integral P x1 x2 y1 y2)
  (define experiment-stream
    (define test
      (lambda () (P (random-in-range (min x1 x2) (max x1 x2))
                    (random-in-range (min y1 y2) (max y1 y2)))))
    (cons-stream test experiment-stream))
  (let ((area (* (abs (- x2 x1)) (abs (- y2 y1)))))
    (stream-map (lambda (p) (* area p)) 
                (monte-carlo experiment-stream 0 0))))

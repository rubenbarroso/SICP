(load "3_70.ss")

(define (weight-sum-cubes pair)
  (let ((i (car pair))
        (j (cadr pair)))
    (+ (* i i i) (* j j j))))

(define sum-cubes
  (weighted-pairs integers integers weight-sum-cubes))

(define (iter pairs weight)
  (let ((car-pairs (stream-car pairs))
        (cadr-pairs (stream-car (stream-cdr pairs)))
        (cddr-pairs (stream-cdr (stream-cdr pairs))))
    (cond ((stream-null? pairs) nil)
          ((= (weight car-pairs)
              (weight cadr-pairs))
           (cons-stream (list (weight car-pairs) car-pairs cadr-pairs)
                        (iter cddr-pairs weight)))
          (else (iter (stream-cdr pairs) weight)))))

(define ramanujan-numbers  
  (iter sum-cubes weight-sum-cubes))

;(display-stream ramanujan-numbers 6)
;(1729 (1 12) (9 10))
;(4104 (2 16) (9 15))
;(13832 (2 24) (18 20))
;(20683 (10 27) (19 24))
;(32832 (4 32) (18 30))
;(39312 (2 34) (15 33))


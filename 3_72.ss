(load "3_70.ss")

(define (weight-sum-squares pair)
  (let ((i (car pair))
        (j (cadr pair)))
    (+ (* i i) (* j j))))

(define sum-squares
  (weighted-pairs integers integers weight-sum-squares))

(define (iter-sq pairs weight)
  (let ((car-pairs (stream-car pairs))
        (cadr-pairs (stream-car (stream-cdr pairs)))
        (caddr-pairs (stream-car (stream-cdr (stream-cdr pairs))))
        (cdddr-pairs (stream-cdr (stream-cdr (stream-cdr pairs)))))
    (cond ((stream-null? pairs) nil)
          ((= (weight car-pairs)
              (weight cadr-pairs)
              (weight caddr-pairs))
           (cons-stream (list (weight car-pairs) 
                              car-pairs 
                              cadr-pairs 
                              caddr-pairs)
                        (iter-sq cdddr-pairs weight)))
          (else (iter-sq (stream-cdr pairs) weight)))))

(define 3way-square-numbers  
  (iter-sq sum-squares weight-sum-squares))

;(display-stream 3way-square-numbers 6)
;(325 (1 18) (6 17) (10 15))
;(425 (5 20) (8 19) (13 16))
;(650 (5 25) (11 23) (17 19))
;(725 (7 26) (10 25) (14 23))
;(845 (2 29) (13 26) (19 22))
;(850 (3 29) (11 27) (15 25))

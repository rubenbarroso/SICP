;(load "text/ch4-ambeval.scm")

(define (a-pythagorean-triple-starting-from low)
  (let ((i (an-integer-starting-from low)))
    (let ((j (an-integer-starting-from i)))
      (let ((k (an-integer-starting-from j)))
        (require (= (+ (* i i) (* j j)) (* k k)))
        (list i j k)))))

;(a-pythagorean-triple-starting-from 1) above will generate:
;(1 1 1)
;(1 1 2)
;(1 1 3)
;(1 1 4)
;...
;Obviously, this does not work because amb searches depth-first

;to solve this, we can 

(define (a-pythagorean-triple-from)
  (let ((k (an-integer-starting-from 1)))
    (let ((i (an-integer-between 1 k)))
      (let ((j (an-integer-between i k)))
        (require (= (+ (* i i) (* j j)) (* k k)))
        (list i j k)))))

;the order of the restrictions does not affect the answer
;OTOH, the performance is penalized depending on the order, since more possibilities might be visited

;generally speaking, we want to invoke the more expensive requirements first
(define (multiple-dwelling)
  (let ((baker (amb 1 2 3 4 5))
        (cooper (amb 1 2 3 4 5))
        (fletcher (amb 1 2 3 4 5))
        (miller (amb 1 2 3 4 5))
        (smith (amb 1 2 3 4 5)))
    (require (not (= baker 5)))
    (require (not (= cooper 1)))
    (require (not (= fletcher 1))) ;swapping these two lines can boost the program execution because more possibilities are discarder earlier
    (require (not (= fletcher 5)))
    (require (> miller cooper))
    (require (not (= (abs (- fletcher cooper)) 1)))
    (require
     (distinct? (list baker cooper fletcher miller smith))) ;this quadratic call is not done every time, like in the original version
    (list (list 'baker baker)
          (list 'cooper cooper)
          (list 'fletcher fletcher)
          (list 'miller miller)
          (list 'smith smith))))

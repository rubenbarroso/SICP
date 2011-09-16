;there are 5^5 assignments before the distinctness requirement
;after that, there are 5!

(define (multiple-dwelling)
  (let ((miller (amb 1 2 3 4 5))
        (cooper (amb 2 3 4 5))) ;we generate only the possible floor numbers
    (require (> miller cooper))
    (let ((fletcher (amb 2 3 4)))
      (require (not (= (abs (- fletcher cooper)) 1)))
      (let ((smith (amb 1 2 3 4 5)))
        (require (not (= (abs (- smith fletcher)) 1)))
        (let ((baker (amb 1 2 3 4)))
          (require
           (distinct? (list baker cooper fletcher miller smith)))
          (list (list 'baker baker)
                (list 'cooper cooper)
                (list 'fletcher fletcher)
                (list 'miller miller)
                (list 'smith smith)))))))











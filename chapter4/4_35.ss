;naive definition
(define (an-integer-between low high)
  (define (generate-items i)
    (if (> i high)
        nil
        (cons i (generate-items (+ i 1)))))
  (an-element-of (generate-items low)))

;another recursive definition
(define (an-integer-between low high)
  (require (<= low high))
  (amb low (an-integer-between (+ low 1) high)))

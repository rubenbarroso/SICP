(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) 
                (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))

;(horner-eval 2 (list 1 3 0 5 0 1))
;1 + x(3 + 0x + 5x^2 + 0x^3 + x^4) =
;1 + x(3 + x(0 + 5x + 0x^2 + x^3)) =
;1 + x(3 + x(0 + x(5 + 0x + x^2))) =
;1 + x(3 + x(0 + x(5 + x(0 + x))))

;(horner-eval 2 (list 1 3 0 5 0 1))
;79
;(horner-eval 2 (list 2 3 0 5 0 1))
;80
(define nil '())

(define (odd-even-parity? a b)
  (or (and (= (remainder a 2) 0)
           (= (remainder b 2) 0))
      (and (= (remainder a 2) 1)
           (= (remainder b 2) 1))))

(define (same-parity x . y)
  (define (same-parity-helper items)
    (cond ((null? items) nil)
          ((odd-even-parity? x (car items)) 
           (append (cons (car items) nil) 
                   (same-parity-helper (cdr items))))
          (else (same-parity-helper (cdr items)))))
  (same-parity-helper (append (cons x nil) y)))

;(same-parity 1 2 3 4 5 6 7)
;(1 3 5 7)
;(same-parity 2 3 4 5 6 7)
;(2 4 6)


